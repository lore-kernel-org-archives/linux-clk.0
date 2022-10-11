Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C425C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 11 Oct 2022 07:28:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbiJKH25 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Oct 2022 03:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiJKH24 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Oct 2022 03:28:56 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9810563FD2
        for <linux-clk@vger.kernel.org>; Tue, 11 Oct 2022 00:28:53 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id v130-20020a1cac88000000b003bcde03bd44so9794801wme.5
        for <linux-clk@vger.kernel.org>; Tue, 11 Oct 2022 00:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L6Q3FH1pjhgUr5lhwZFS1aDnpCMV8ZVWjlKCftWD96k=;
        b=afzAlCQTLtR9nfXoQ1tQxDVSC8xCRv7c7iAWvDaogK+5Y5P7SvbdT5ng8O+JtOzQtY
         B5TK65n3qnxRV0n2bR5RLHMhwK7+j2Ht6QcAQLHoPaVfbAdzbBc2OJgbLQf+BehVpDON
         MYjHPydXBKqy4m+x75b669TOmnzfZdhJYCX/Gyaj7aeigsEE/fC/95MO+DX32932rQmS
         6/xtKHeNDbS6FWWOBFpFj2KvJKjhhZ+EVwGtF+C3/i+Ucbx9JAcK7vH1uUB9XvT/Og7B
         gt204T2eAn57RG0gPmyy8I61CR/4q8l6rhnItubQY4mdyIfq7ayZdLPsUFPwyq85nbvJ
         syEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6Q3FH1pjhgUr5lhwZFS1aDnpCMV8ZVWjlKCftWD96k=;
        b=f4JF1YcNH1LB0950IDknIWEpLk3Z6qWCSETwTZDoC1zd7bglAUwmlgezzE7S5gz//Z
         kXuTfBI0ipoBrfyfkwSS2AvE1k5TME3ug8dYjhZNs39JotDBBzawUAuEylPA7POjZT7d
         A77kFmdQVcpb1tOrrJfpUqJuHwN4fy0QLXE4ULoh1vEsl+A8Hq91m79shjQ3aI3dgUfp
         /tezyyVeN/fOf5cvgF25df8CVd2lu0c+gGxbYHba5V0vc1ktzQFqWPCX0fNCV+u09r7H
         zd8flkq+ChclOxSDFWWTUQWJS61SKL+VALtwXW7c2OA62zm9Np7P+I4TCu8vP7T+MvTr
         mStQ==
X-Gm-Message-State: ACrzQf3IhQ79pC96wdgYmEL+AhhfabeInLs7RutspVMsJvWNfkKSxBuK
        POzULTObBOm/j0AGgke4PX+J3vVUSaCVNXCm
X-Google-Smtp-Source: AMsMyM7Kwn2ayYOVk5IGzOD/v38aC0pTb/Ct/QLbRcOPMJdh7RgneSnu1C7/aBEQYTNw6VzXk5CNBw==
X-Received: by 2002:a05:600c:3554:b0:3c3:fdfd:f393 with SMTP id i20-20020a05600c355400b003c3fdfdf393mr12395426wmq.188.1665473331966;
        Tue, 11 Oct 2022 00:28:51 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id j3-20020a5d6043000000b0022f864164edsm7246708wrt.6.2022.10.11.00.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 00:28:51 -0700 (PDT)
Date:   Tue, 11 Oct 2022 09:28:50 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vfedorenko@novek.ru>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, Vadim Fedorenko <vadfed@fb.com>
Subject: Re: [RFC PATCH v3 4/6] dpll: get source/output name
Message-ID: <Y0UbMsXWuPqTd7p4@nanopsycho>
References: <20221010011804.23716-1-vfedorenko@novek.ru>
 <20221010011804.23716-5-vfedorenko@novek.ru>
 <Y0Pp019euDMHOjJu@nanopsycho>
 <3a6330df-4fe0-d103-8663-80f3698d66f3@novek.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a6330df-4fe0-d103-8663-80f3698d66f3@novek.ru>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Mon, Oct 10, 2022 at 09:55:57PM CEST, vfedorenko@novek.ru wrote:
>On 10.10.2022 10:45, Jiri Pirko wrote:
>> Mon, Oct 10, 2022 at 03:18:02AM CEST, vfedorenko@novek.ru wrote:
>> > From: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>> > 
>> > Dump names of sources and outputs in response to DPLL_CMD_DEVICE_GET dump
>> > request.
>> > 
>> > Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>> > ---
>> > drivers/dpll/dpll_netlink.c | 24 ++++++++++++++++++++++++
>> > include/linux/dpll.h        |  2 ++
>> > include/uapi/linux/dpll.h   |  2 ++
>> > 3 files changed, 28 insertions(+)
>> > 
>> > diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c
>> > index a5779871537a..e3604c10b59e 100644
>> > --- a/drivers/dpll/dpll_netlink.c
>> > +++ b/drivers/dpll/dpll_netlink.c
>> > @@ -31,12 +31,16 @@ static const struct nla_policy dpll_genl_set_source_policy[] = {
>> > 	[DPLLA_DEVICE_ID]	= { .type = NLA_U32 },
>> > 	[DPLLA_SOURCE_ID]	= { .type = NLA_U32 },
>> > 	[DPLLA_SOURCE_TYPE]	= { .type = NLA_U32 },
>> > +	[DPLLA_SOURCE_NAME]	= { .type = NLA_STRING,
>> > +				    .len = DPLL_NAME_LENGTH },
>> > };
>> > 
>> > static const struct nla_policy dpll_genl_set_output_policy[] = {
>> > 	[DPLLA_DEVICE_ID]	= { .type = NLA_U32 },
>> > 	[DPLLA_OUTPUT_ID]	= { .type = NLA_U32 },
>> > 	[DPLLA_OUTPUT_TYPE]	= { .type = NLA_U32 },
>> > +	[DPLLA_OUTPUT_NAME]	= { .type = NLA_STRING,
>> > +				    .len = DPLL_NAME_LENGTH },
>> > };
>> > 
>> > static const struct nla_policy dpll_genl_set_src_select_mode_policy[] = {
>> > @@ -100,6 +104,7 @@ static int __dpll_cmd_dump_sources(struct dpll_device *dpll,
>> > {
>> > 	int i, ret = 0, type, prio;
>> > 	struct nlattr *src_attr;
>> > +	const char *name;
>> > 
>> > 	for (i = 0; i < dpll->sources_count; i++) {
>> > 		src_attr = nla_nest_start(msg, DPLLA_SOURCE);
>> > @@ -132,6 +137,15 @@ static int __dpll_cmd_dump_sources(struct dpll_device *dpll,
>> > 				break;
>> > 			}
>> > 		}
>> > +		if (dpll->ops->get_source_name) {
>> > +			name = dpll->ops->get_source_name(dpll, i);
>> > +			if (name && nla_put_string(msg, DPLLA_SOURCE_NAME,
>> > +						   name)) {
>> > +				nla_nest_cancel(msg, src_attr);
>> > +				ret = -EMSGSIZE;
>> > +				break;
>> > +			}
>> > +		}
>> > 		nla_nest_end(msg, src_attr);
>> > 	}
>> > 
>> > @@ -143,6 +157,7 @@ static int __dpll_cmd_dump_outputs(struct dpll_device *dpll,
>> > {
>> > 	struct nlattr *out_attr;
>> > 	int i, ret = 0, type;
>> > +	const char *name;
>> > 
>> > 	for (i = 0; i < dpll->outputs_count; i++) {
>> > 		out_attr = nla_nest_start(msg, DPLLA_OUTPUT);
>> > @@ -167,6 +182,15 @@ static int __dpll_cmd_dump_outputs(struct dpll_device *dpll,
>> > 			}
>> > 			ret = 0;
>> > 		}
>> > +		if (dpll->ops->get_output_name) {
>> > +			name = dpll->ops->get_output_name(dpll, i);
>> > +			if (name && nla_put_string(msg, DPLLA_OUTPUT_NAME,
>> > +						   name)) {
>> > +				nla_nest_cancel(msg, out_attr);
>> > +				ret = -EMSGSIZE;
>> > +				break;
>> > +			}
>> > +		}
>> > 		nla_nest_end(msg, out_attr);
>> > 	}
>> > 
>> > diff --git a/include/linux/dpll.h b/include/linux/dpll.h
>> > index 3fe957a06b90..2f4964dc28f0 100644
>> > --- a/include/linux/dpll.h
>> > +++ b/include/linux/dpll.h
>> > @@ -23,6 +23,8 @@ struct dpll_device_ops {
>> > 	int (*set_output_type)(struct dpll_device *dpll, int id, int val);
>> > 	int (*set_source_select_mode)(struct dpll_device *dpll, int mode);
>> > 	int (*set_source_prio)(struct dpll_device *dpll, int id, int prio);
>> > +	const char *(*get_source_name)(struct dpll_device *dpll, int id);
>> > +	const char *(*get_output_name)(struct dpll_device *dpll, int id);
>> 
>> Hmm, why you exactly need the name for?
>> 
>As with device name, user-space app can use source/output name to easily
>select one using configuration value, for example.

Can you give me some examples? I can't imagine how it can be named
differently than containing the "type string". My point is to avoid
drivers to come up with original names that basically have the same
meaning creating a mess.

Why index (which is predictable and could be used in scripts) isn't
enough?

Or, alternatively, we can leave the "resolve" up to the userspace app.
Example:
index 0
  type 1PPS
index 1
  type 10MHZ
index 2
  type SyncE
  ifindex 20
index 3
  type SyncE
  ifindex 30

Now when user does:
1) dpll X source set index 0
   could be equivalent to
   dpll X source set 1pps
     dpll app would do dump of all sources and if there is only one of
     type 1pps, it will resolve it to index 0 which it is going to send
     via ATTR_INDEX to kernel.
2) dpll X source set index 2
   could be equivalent to
   dpll X source set eth1
     dpll app would use rtnetlink to get ifindex 20 for eth1. Then it
     will do dump of all sources and see if there is SyncE source with
     ifindex 30. This will resolve to index 2 which it is going to send
     via ATTR_INDEX to kernel.

>> 
>> > };
>> > 
>> > struct dpll_device *dpll_device_alloc(struct dpll_device_ops *ops, const char *name,
>> > diff --git a/include/uapi/linux/dpll.h b/include/uapi/linux/dpll.h
>> > index f6b674e5cf01..8782d3425aae 100644
>> > --- a/include/uapi/linux/dpll.h
>> > +++ b/include/uapi/linux/dpll.h
>> > @@ -26,11 +26,13 @@ enum dpll_genl_attr {
>> > 	DPLLA_SOURCE,
>> > 	DPLLA_SOURCE_ID,
>> > 	DPLLA_SOURCE_TYPE,
>> > +	DPLLA_SOURCE_NAME,
>> > 	DPLLA_SOURCE_SUPPORTED,
>> > 	DPLLA_SOURCE_PRIO,
>> > 	DPLLA_OUTPUT,
>> > 	DPLLA_OUTPUT_ID,
>> > 	DPLLA_OUTPUT_TYPE,
>> > +	DPLLA_OUTPUT_NAME,
>> > 	DPLLA_OUTPUT_SUPPORTED,
>> > 	DPLLA_STATUS,
>> > 	DPLLA_TEMP,
>> > -- 
>> > 2.27.0
>> > 
>
