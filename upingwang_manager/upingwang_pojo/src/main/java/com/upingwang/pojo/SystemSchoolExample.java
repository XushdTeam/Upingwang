package com.upingwang.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SystemSchoolExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SystemSchoolExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Long value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Long value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Long value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Long value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Long value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Long value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Long> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Long> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Long value1, Long value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Long value1, Long value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andBureauIdIsNull() {
            addCriterion("bureau_id is null");
            return (Criteria) this;
        }

        public Criteria andBureauIdIsNotNull() {
            addCriterion("bureau_id is not null");
            return (Criteria) this;
        }

        public Criteria andBureauIdEqualTo(Long value) {
            addCriterion("bureau_id =", value, "bureauId");
            return (Criteria) this;
        }

        public Criteria andBureauIdNotEqualTo(Long value) {
            addCriterion("bureau_id <>", value, "bureauId");
            return (Criteria) this;
        }

        public Criteria andBureauIdGreaterThan(Long value) {
            addCriterion("bureau_id >", value, "bureauId");
            return (Criteria) this;
        }

        public Criteria andBureauIdGreaterThanOrEqualTo(Long value) {
            addCriterion("bureau_id >=", value, "bureauId");
            return (Criteria) this;
        }

        public Criteria andBureauIdLessThan(Long value) {
            addCriterion("bureau_id <", value, "bureauId");
            return (Criteria) this;
        }

        public Criteria andBureauIdLessThanOrEqualTo(Long value) {
            addCriterion("bureau_id <=", value, "bureauId");
            return (Criteria) this;
        }

        public Criteria andBureauIdIn(List<Long> values) {
            addCriterion("bureau_id in", values, "bureauId");
            return (Criteria) this;
        }

        public Criteria andBureauIdNotIn(List<Long> values) {
            addCriterion("bureau_id not in", values, "bureauId");
            return (Criteria) this;
        }

        public Criteria andBureauIdBetween(Long value1, Long value2) {
            addCriterion("bureau_id between", value1, value2, "bureauId");
            return (Criteria) this;
        }

        public Criteria andBureauIdNotBetween(Long value1, Long value2) {
            addCriterion("bureau_id not between", value1, value2, "bureauId");
            return (Criteria) this;
        }

        public Criteria andSchoolCodeIsNull() {
            addCriterion("school_code is null");
            return (Criteria) this;
        }

        public Criteria andSchoolCodeIsNotNull() {
            addCriterion("school_code is not null");
            return (Criteria) this;
        }

        public Criteria andSchoolCodeEqualTo(String value) {
            addCriterion("school_code =", value, "schoolCode");
            return (Criteria) this;
        }

        public Criteria andSchoolCodeNotEqualTo(String value) {
            addCriterion("school_code <>", value, "schoolCode");
            return (Criteria) this;
        }

        public Criteria andSchoolCodeGreaterThan(String value) {
            addCriterion("school_code >", value, "schoolCode");
            return (Criteria) this;
        }

        public Criteria andSchoolCodeGreaterThanOrEqualTo(String value) {
            addCriterion("school_code >=", value, "schoolCode");
            return (Criteria) this;
        }

        public Criteria andSchoolCodeLessThan(String value) {
            addCriterion("school_code <", value, "schoolCode");
            return (Criteria) this;
        }

        public Criteria andSchoolCodeLessThanOrEqualTo(String value) {
            addCriterion("school_code <=", value, "schoolCode");
            return (Criteria) this;
        }

        public Criteria andSchoolCodeLike(String value) {
            addCriterion("school_code like", value, "schoolCode");
            return (Criteria) this;
        }

        public Criteria andSchoolCodeNotLike(String value) {
            addCriterion("school_code not like", value, "schoolCode");
            return (Criteria) this;
        }

        public Criteria andSchoolCodeIn(List<String> values) {
            addCriterion("school_code in", values, "schoolCode");
            return (Criteria) this;
        }

        public Criteria andSchoolCodeNotIn(List<String> values) {
            addCriterion("school_code not in", values, "schoolCode");
            return (Criteria) this;
        }

        public Criteria andSchoolCodeBetween(String value1, String value2) {
            addCriterion("school_code between", value1, value2, "schoolCode");
            return (Criteria) this;
        }

        public Criteria andSchoolCodeNotBetween(String value1, String value2) {
            addCriterion("school_code not between", value1, value2, "schoolCode");
            return (Criteria) this;
        }

        public Criteria andSchoolNameIsNull() {
            addCriterion("school_name is null");
            return (Criteria) this;
        }

        public Criteria andSchoolNameIsNotNull() {
            addCriterion("school_name is not null");
            return (Criteria) this;
        }

        public Criteria andSchoolNameEqualTo(String value) {
            addCriterion("school_name =", value, "schoolName");
            return (Criteria) this;
        }

        public Criteria andSchoolNameNotEqualTo(String value) {
            addCriterion("school_name <>", value, "schoolName");
            return (Criteria) this;
        }

        public Criteria andSchoolNameGreaterThan(String value) {
            addCriterion("school_name >", value, "schoolName");
            return (Criteria) this;
        }

        public Criteria andSchoolNameGreaterThanOrEqualTo(String value) {
            addCriterion("school_name >=", value, "schoolName");
            return (Criteria) this;
        }

        public Criteria andSchoolNameLessThan(String value) {
            addCriterion("school_name <", value, "schoolName");
            return (Criteria) this;
        }

        public Criteria andSchoolNameLessThanOrEqualTo(String value) {
            addCriterion("school_name <=", value, "schoolName");
            return (Criteria) this;
        }

        public Criteria andSchoolNameLike(String value) {
            addCriterion("school_name like", value, "schoolName");
            return (Criteria) this;
        }

        public Criteria andSchoolNameNotLike(String value) {
            addCriterion("school_name not like", value, "schoolName");
            return (Criteria) this;
        }

        public Criteria andSchoolNameIn(List<String> values) {
            addCriterion("school_name in", values, "schoolName");
            return (Criteria) this;
        }

        public Criteria andSchoolNameNotIn(List<String> values) {
            addCriterion("school_name not in", values, "schoolName");
            return (Criteria) this;
        }

        public Criteria andSchoolNameBetween(String value1, String value2) {
            addCriterion("school_name between", value1, value2, "schoolName");
            return (Criteria) this;
        }

        public Criteria andSchoolNameNotBetween(String value1, String value2) {
            addCriterion("school_name not between", value1, value2, "schoolName");
            return (Criteria) this;
        }

        public Criteria andSchoolAddressIsNull() {
            addCriterion("school_address is null");
            return (Criteria) this;
        }

        public Criteria andSchoolAddressIsNotNull() {
            addCriterion("school_address is not null");
            return (Criteria) this;
        }

        public Criteria andSchoolAddressEqualTo(String value) {
            addCriterion("school_address =", value, "schoolAddress");
            return (Criteria) this;
        }

        public Criteria andSchoolAddressNotEqualTo(String value) {
            addCriterion("school_address <>", value, "schoolAddress");
            return (Criteria) this;
        }

        public Criteria andSchoolAddressGreaterThan(String value) {
            addCriterion("school_address >", value, "schoolAddress");
            return (Criteria) this;
        }

        public Criteria andSchoolAddressGreaterThanOrEqualTo(String value) {
            addCriterion("school_address >=", value, "schoolAddress");
            return (Criteria) this;
        }

        public Criteria andSchoolAddressLessThan(String value) {
            addCriterion("school_address <", value, "schoolAddress");
            return (Criteria) this;
        }

        public Criteria andSchoolAddressLessThanOrEqualTo(String value) {
            addCriterion("school_address <=", value, "schoolAddress");
            return (Criteria) this;
        }

        public Criteria andSchoolAddressLike(String value) {
            addCriterion("school_address like", value, "schoolAddress");
            return (Criteria) this;
        }

        public Criteria andSchoolAddressNotLike(String value) {
            addCriterion("school_address not like", value, "schoolAddress");
            return (Criteria) this;
        }

        public Criteria andSchoolAddressIn(List<String> values) {
            addCriterion("school_address in", values, "schoolAddress");
            return (Criteria) this;
        }

        public Criteria andSchoolAddressNotIn(List<String> values) {
            addCriterion("school_address not in", values, "schoolAddress");
            return (Criteria) this;
        }

        public Criteria andSchoolAddressBetween(String value1, String value2) {
            addCriterion("school_address between", value1, value2, "schoolAddress");
            return (Criteria) this;
        }

        public Criteria andSchoolAddressNotBetween(String value1, String value2) {
            addCriterion("school_address not between", value1, value2, "schoolAddress");
            return (Criteria) this;
        }

        public Criteria andSchoolLogoIsNull() {
            addCriterion("school_logo is null");
            return (Criteria) this;
        }

        public Criteria andSchoolLogoIsNotNull() {
            addCriterion("school_logo is not null");
            return (Criteria) this;
        }

        public Criteria andSchoolLogoEqualTo(String value) {
            addCriterion("school_logo =", value, "schoolLogo");
            return (Criteria) this;
        }

        public Criteria andSchoolLogoNotEqualTo(String value) {
            addCriterion("school_logo <>", value, "schoolLogo");
            return (Criteria) this;
        }

        public Criteria andSchoolLogoGreaterThan(String value) {
            addCriterion("school_logo >", value, "schoolLogo");
            return (Criteria) this;
        }

        public Criteria andSchoolLogoGreaterThanOrEqualTo(String value) {
            addCriterion("school_logo >=", value, "schoolLogo");
            return (Criteria) this;
        }

        public Criteria andSchoolLogoLessThan(String value) {
            addCriterion("school_logo <", value, "schoolLogo");
            return (Criteria) this;
        }

        public Criteria andSchoolLogoLessThanOrEqualTo(String value) {
            addCriterion("school_logo <=", value, "schoolLogo");
            return (Criteria) this;
        }

        public Criteria andSchoolLogoLike(String value) {
            addCriterion("school_logo like", value, "schoolLogo");
            return (Criteria) this;
        }

        public Criteria andSchoolLogoNotLike(String value) {
            addCriterion("school_logo not like", value, "schoolLogo");
            return (Criteria) this;
        }

        public Criteria andSchoolLogoIn(List<String> values) {
            addCriterion("school_logo in", values, "schoolLogo");
            return (Criteria) this;
        }

        public Criteria andSchoolLogoNotIn(List<String> values) {
            addCriterion("school_logo not in", values, "schoolLogo");
            return (Criteria) this;
        }

        public Criteria andSchoolLogoBetween(String value1, String value2) {
            addCriterion("school_logo between", value1, value2, "schoolLogo");
            return (Criteria) this;
        }

        public Criteria andSchoolLogoNotBetween(String value1, String value2) {
            addCriterion("school_logo not between", value1, value2, "schoolLogo");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkmanIsNull() {
            addCriterion("school_linkman is null");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkmanIsNotNull() {
            addCriterion("school_linkman is not null");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkmanEqualTo(String value) {
            addCriterion("school_linkman =", value, "schoolLinkman");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkmanNotEqualTo(String value) {
            addCriterion("school_linkman <>", value, "schoolLinkman");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkmanGreaterThan(String value) {
            addCriterion("school_linkman >", value, "schoolLinkman");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkmanGreaterThanOrEqualTo(String value) {
            addCriterion("school_linkman >=", value, "schoolLinkman");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkmanLessThan(String value) {
            addCriterion("school_linkman <", value, "schoolLinkman");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkmanLessThanOrEqualTo(String value) {
            addCriterion("school_linkman <=", value, "schoolLinkman");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkmanLike(String value) {
            addCriterion("school_linkman like", value, "schoolLinkman");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkmanNotLike(String value) {
            addCriterion("school_linkman not like", value, "schoolLinkman");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkmanIn(List<String> values) {
            addCriterion("school_linkman in", values, "schoolLinkman");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkmanNotIn(List<String> values) {
            addCriterion("school_linkman not in", values, "schoolLinkman");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkmanBetween(String value1, String value2) {
            addCriterion("school_linkman between", value1, value2, "schoolLinkman");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkmanNotBetween(String value1, String value2) {
            addCriterion("school_linkman not between", value1, value2, "schoolLinkman");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkphoneIsNull() {
            addCriterion("school_linkphone is null");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkphoneIsNotNull() {
            addCriterion("school_linkphone is not null");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkphoneEqualTo(String value) {
            addCriterion("school_linkphone =", value, "schoolLinkphone");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkphoneNotEqualTo(String value) {
            addCriterion("school_linkphone <>", value, "schoolLinkphone");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkphoneGreaterThan(String value) {
            addCriterion("school_linkphone >", value, "schoolLinkphone");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkphoneGreaterThanOrEqualTo(String value) {
            addCriterion("school_linkphone >=", value, "schoolLinkphone");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkphoneLessThan(String value) {
            addCriterion("school_linkphone <", value, "schoolLinkphone");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkphoneLessThanOrEqualTo(String value) {
            addCriterion("school_linkphone <=", value, "schoolLinkphone");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkphoneLike(String value) {
            addCriterion("school_linkphone like", value, "schoolLinkphone");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkphoneNotLike(String value) {
            addCriterion("school_linkphone not like", value, "schoolLinkphone");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkphoneIn(List<String> values) {
            addCriterion("school_linkphone in", values, "schoolLinkphone");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkphoneNotIn(List<String> values) {
            addCriterion("school_linkphone not in", values, "schoolLinkphone");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkphoneBetween(String value1, String value2) {
            addCriterion("school_linkphone between", value1, value2, "schoolLinkphone");
            return (Criteria) this;
        }

        public Criteria andSchoolLinkphoneNotBetween(String value1, String value2) {
            addCriterion("school_linkphone not between", value1, value2, "schoolLinkphone");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(Integer value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Integer value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Integer value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Integer value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Integer value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Integer> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Integer> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Integer value1, Integer value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andDelflagIsNull() {
            addCriterion("delflag is null");
            return (Criteria) this;
        }

        public Criteria andDelflagIsNotNull() {
            addCriterion("delflag is not null");
            return (Criteria) this;
        }

        public Criteria andDelflagEqualTo(Integer value) {
            addCriterion("delflag =", value, "delflag");
            return (Criteria) this;
        }

        public Criteria andDelflagNotEqualTo(Integer value) {
            addCriterion("delflag <>", value, "delflag");
            return (Criteria) this;
        }

        public Criteria andDelflagGreaterThan(Integer value) {
            addCriterion("delflag >", value, "delflag");
            return (Criteria) this;
        }

        public Criteria andDelflagGreaterThanOrEqualTo(Integer value) {
            addCriterion("delflag >=", value, "delflag");
            return (Criteria) this;
        }

        public Criteria andDelflagLessThan(Integer value) {
            addCriterion("delflag <", value, "delflag");
            return (Criteria) this;
        }

        public Criteria andDelflagLessThanOrEqualTo(Integer value) {
            addCriterion("delflag <=", value, "delflag");
            return (Criteria) this;
        }

        public Criteria andDelflagIn(List<Integer> values) {
            addCriterion("delflag in", values, "delflag");
            return (Criteria) this;
        }

        public Criteria andDelflagNotIn(List<Integer> values) {
            addCriterion("delflag not in", values, "delflag");
            return (Criteria) this;
        }

        public Criteria andDelflagBetween(Integer value1, Integer value2) {
            addCriterion("delflag between", value1, value2, "delflag");
            return (Criteria) this;
        }

        public Criteria andDelflagNotBetween(Integer value1, Integer value2) {
            addCriterion("delflag not between", value1, value2, "delflag");
            return (Criteria) this;
        }

        public Criteria andCreateUserIsNull() {
            addCriterion("create_user is null");
            return (Criteria) this;
        }

        public Criteria andCreateUserIsNotNull() {
            addCriterion("create_user is not null");
            return (Criteria) this;
        }

        public Criteria andCreateUserEqualTo(String value) {
            addCriterion("create_user =", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotEqualTo(String value) {
            addCriterion("create_user <>", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserGreaterThan(String value) {
            addCriterion("create_user >", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserGreaterThanOrEqualTo(String value) {
            addCriterion("create_user >=", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserLessThan(String value) {
            addCriterion("create_user <", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserLessThanOrEqualTo(String value) {
            addCriterion("create_user <=", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserLike(String value) {
            addCriterion("create_user like", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotLike(String value) {
            addCriterion("create_user not like", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserIn(List<String> values) {
            addCriterion("create_user in", values, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotIn(List<String> values) {
            addCriterion("create_user not in", values, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserBetween(String value1, String value2) {
            addCriterion("create_user between", value1, value2, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotBetween(String value1, String value2) {
            addCriterion("create_user not between", value1, value2, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}