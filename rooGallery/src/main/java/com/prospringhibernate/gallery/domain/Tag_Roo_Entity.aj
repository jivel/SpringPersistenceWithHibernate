package com.prospringhibernate.gallery.domain;

import com.prospringhibernate.gallery.domain.Tag;
import java.lang.Integer;
import java.lang.Long;
import java.lang.SuppressWarnings;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Tag_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Tag.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Tag.id;
    
    @Version
    @Column(name = "version")
    private Integer Tag.version;
    
    public Long Tag.getId() {
        return this.id;
    }
    
    public void Tag.setId(Long id) {
        this.id = id;
    }
    
    public Integer Tag.getVersion() {
        return this.version;
    }
    
    public void Tag.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Tag.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Tag.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Tag attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Tag.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Tag Tag.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Tag merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Tag.entityManager() {
        EntityManager em = new Tag().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Tag.countTags() {
        return ((Number) entityManager().createQuery("select count(o) from Tag o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<Tag> Tag.findAllTags() {
        return entityManager().createQuery("select o from Tag o").getResultList();
    }
    
    public static Tag Tag.findTag(Long id) {
        if (id == null) return null;
        return entityManager().find(Tag.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<Tag> Tag.findTagEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Tag o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
