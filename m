Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3A9C0015E
	for <linux-clk@archiver.kernel.org>; Tue,  1 Aug 2023 12:23:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231697AbjHAMXf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Aug 2023 08:23:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232302AbjHAMXe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Aug 2023 08:23:34 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8484F1FD2
        for <linux-clk@vger.kernel.org>; Tue,  1 Aug 2023 05:23:30 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b974031aeaso85484561fa.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Aug 2023 05:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1690892609; x=1691497409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3dKKb8ls1yAP3+3mMQaiILbL8e0BLGeeP71QwTnllps=;
        b=DkC0mBvOrKncTR0k7i72XDXDqoiXnY5ESHrTxvblfT+XNNur60TNYc0Eu8RO3om33H
         dyIhrfT/uhhl6ep/jzS4FuRLnjsNK4XunT+VmqruJLEKbscR9sAn6PbhEhM9Ugf8jwUB
         y46izYudAlIV4wvT/BChT8Xg6Cl2TMQoLaxj3IwocqY0Uj8XWtE+lmK1jnWrLnIqOMit
         VGhdwPJTHBa4TEWcfBZqUoyFlr+Uj38ZcFHCpEnGfrG3VI32dTQpl3/PwCEA1Fx/M707
         dNPeHcGmcXMphSO4fiSpc9Z3/Rb7/nCyvqYJKYofitaY6MEtoHrAr/bsaighbpJh5u3T
         SymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690892609; x=1691497409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dKKb8ls1yAP3+3mMQaiILbL8e0BLGeeP71QwTnllps=;
        b=H4OpQrKdMSBzMDpl3ilI2g/e6rIKbFd+IQgdgGum6kLmmPAXZGYLPbRPwxyZVLWFSJ
         ylzxeDeFyXIY2Oyh/DPiZD19UmT0jh2yFHm7rdbUI3i2BMurj8JcsXUFAsIk6mps8m73
         8qkvSZd2w3H/RxeRwFJnEQIiHAb45tddpyIh2y+rQ71dN4MDCIYec/fEgdQS4XCnzS5e
         KY+MCqb/YPaNXaAEq4P2NRxiIheVNSlLCX0aZ+7xeH1LjxJvry/MTdXfYn2BcJs04NXU
         /eIbVZf1WTncJLzLvdZLd+y8tRd1t9q/llOJzw1u4NVbntrzTS8YuwOpH/OorL2crL8A
         fxQw==
X-Gm-Message-State: ABy/qLYefJtpMWiKp4BthS5TZ82QeYqf4p49/VF8YdJxrE5QFuOdjaHQ
        XQXNLWH6kjdObj2aP3gU5u/6fQ==
X-Google-Smtp-Source: APBJJlF/3jq9D6dGWILWuPZqPWOO2eVUUSeT2OYvPtJDFMk/nXyWLvKlRdfiSnt1TvyeRIWwt+jppA==
X-Received: by 2002:a2e:b0fb:0:b0:2b9:eb0f:c733 with SMTP id h27-20020a2eb0fb000000b002b9eb0fc733mr2426646ljl.35.1690892608710;
        Tue, 01 Aug 2023 05:23:28 -0700 (PDT)
Received: from localhost ([212.23.236.67])
        by smtp.gmail.com with ESMTPSA id si15-20020a170906cecf00b00993004239a4sm7585260ejb.215.2023.08.01.05.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 05:23:27 -0700 (PDT)
Date:   Tue, 1 Aug 2023 14:23:26 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH net-next 06/11] dpll: netlink: Add DPLL framework base
 functions
Message-ID: <ZMj5PrwZK3Fat7fT@nanopsycho>
References: <20230720091903.297066-1-vadim.fedorenko@linux.dev>
 <20230720091903.297066-7-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720091903.297066-7-vadim.fedorenko@linux.dev>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thu, Jul 20, 2023 at 11:18:58AM CEST, vadim.fedorenko@linux.dev wrote:

[...]

>+
>+static int
>+dpll_pin_parent_device_set(struct dpll_pin *pin, struct nlattr *parent_nest,
>+			   struct netlink_ext_ack *extack)
>+{
>+	struct nlattr *tb[DPLL_A_MAX + 1];
>+	enum dpll_pin_direction direction;
>+	enum dpll_pin_state state;
>+	struct dpll_pin_ref *ref;
>+	struct dpll_device *dpll;
>+	u32 pdpll_idx, prio;
>+	int ret;
>+
>+	nla_parse_nested(tb, DPLL_A_MAX, parent_nest,
>+			 NULL, extack);

Please pass proper policy instead of NULL here.
dpll_pin_parent_device_nl_policy


>+	if (!tb[DPLL_A_ID]) {
>+		NL_SET_ERR_MSG(extack, "device parent id expected");
>+		return -EINVAL;
>+	}
>+	pdpll_idx = nla_get_u32(tb[DPLL_A_ID]);
>+	dpll = xa_load(&dpll_device_xa, pdpll_idx);
>+	if (!dpll)
>+		return -EINVAL;
>+	ref = xa_load(&pin->dpll_refs, dpll->device_idx);
>+	ASSERT_NOT_NULL(ref);
>+	if (tb[DPLL_A_PIN_STATE]) {
>+		state = nla_get_u8(tb[DPLL_A_PIN_STATE]);
>+		ret = dpll_pin_state_set(dpll, pin, state, extack);
>+		if (ret)
>+			return ret;
>+	}
>+	if (tb[DPLL_A_PIN_PRIO]) {
>+		prio = nla_get_u8(tb[DPLL_A_PIN_PRIO]);
>+		ret = dpll_pin_prio_set(dpll, pin, prio, extack);
>+		if (ret)
>+			return ret;
>+	}
>+	if (tb[DPLL_A_PIN_DIRECTION]) {
>+		direction = nla_get_u8(tb[DPLL_A_PIN_DIRECTION]);
>+		ret = dpll_pin_direction_set(pin, dpll, direction, extack);
>+		if (ret)
>+			return ret;
>+	}
>+	return 0;
>+}
>+
>+static int
>+dpll_pin_parent_pin_set(struct dpll_pin *pin, struct nlattr *parent_nest,
>+			struct netlink_ext_ack *extack)
>+{
>+	struct nlattr *tb[DPLL_A_MAX + 1];
>+	enum dpll_pin_state state;
>+	u32 ppin_idx;
>+	int ret;
>+
>+	nla_parse_nested(tb, DPLL_A_MAX, parent_nest,
>+			 NULL, extack);

Please pass proper policy instead of NULL here.
dpll_pin_parent_pin_nl_policy


>+	if (!tb[DPLL_A_PIN_ID]) {
>+		NL_SET_ERR_MSG(extack, "parent pin id expected");
>+		return -EINVAL;
>+	}
>+	ppin_idx = nla_get_u32(tb[DPLL_A_PIN_ID]);
>+	state = nla_get_u8(tb[DPLL_A_PIN_STATE]);
>+	ret = dpll_pin_on_pin_state_set(pin, ppin_idx, state, extack);
>+	if (ret)
>+		return ret;
>+
>+	return 0;
>+}

[...]
