Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16E0C7618A
	for <linux-clk@archiver.kernel.org>; Fri, 17 Mar 2023 16:22:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbjCQQWE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Mar 2023 12:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjCQQWD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Mar 2023 12:22:03 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07EBC1BC4
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 09:22:01 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so3725717wmq.1
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 09:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112; t=1679070120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WK9yNSRVMlEjJBHOwhJwHBFPa8SNWqT9uE9ABk62B2U=;
        b=DG/fto1x98uQ7dSsGetIjYJWDexNDd5i4LfyYi7NUiz/WSFew62SHnWLIBzbeuVYJA
         PTxVBfS1gAOEUEiymezfy1LtBiNhWQOav3DpLy6ja3+l8BNlAJtDisQteOWEKOL/033d
         El5MmsPw4Of/YpfYhjCD52HU4YVV/Emc57hGz11Lkmwe/ttLSF5IYTlqkxYby+p5A7KE
         J6ZMSBeAVQSMC+5CH+jugzxU9DC9Bm01if+a2T2Rn72sjm/AuCE3jjzMpOqSWC74SJk9
         hHuE3ZUuCkm548uyPlOxaNNc+RMfCf+DkSFe2q/m5SSxooUZIDIxjXz6U8W6uJFmICCL
         txOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679070120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WK9yNSRVMlEjJBHOwhJwHBFPa8SNWqT9uE9ABk62B2U=;
        b=QMrvcHruBgvmgi6iinviepPToV1aKJRHL2zl34Q5n0i6GCM6uHk3sCvTG+hbFgdVBv
         7nrIum8hdhOglUNoq6mS4pan1gK7Kdodik53gNcJLcpDA7bxdQL/iLXOOHzO5Vq/Il5T
         deF+mKWuKINMjx+AgBXPd7wvtxrDll/fK1A7kBlESxLyxvP25oRBosrjZPVfHkpOZ/gk
         sNa8YEgcaw4bBn7xJd55S+SdCfV55+AKsrLzuQOwcTcblGfR3uuHDqRGyvu1/draQaLU
         WvPXDY9fTj9u5aRUJj2U1C9KFsqBrZRn05jm6Lqlw3tGySbGseRa9g7H9/rQqu0Tc98/
         luLw==
X-Gm-Message-State: AO0yUKVgrA4BtmX+W5lYfsGc+wt0+aQ1qO3GC3Qog5WmQvb5EN8IcULf
        iNVu7TA3mpTQqZnRWDQcHLsAxQ==
X-Google-Smtp-Source: AK7set8HoNwwA1+/Xl56688DC6BYt9rhtjCtl5fanZOEjjmCrJBpY85I6piUWRSAGVEqRLFCTdji7w==
X-Received: by 2002:a05:600c:1546:b0:3ed:22f2:554c with SMTP id f6-20020a05600c154600b003ed22f2554cmr18431844wmg.29.1679070120483;
        Fri, 17 Mar 2023 09:22:00 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id q8-20020a1cf308000000b003ed4f6c6234sm2408743wmq.23.2023.03.17.09.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 09:21:59 -0700 (PDT)
Date:   Fri, 17 Mar 2023 17:21:58 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadfed@meta.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>
Subject: Re: [PATCH RFC v6 2/6] dpll: Add DPLL framework base functions
Message-ID: <ZBSTpoN6BOn5264a@nanopsycho>
References: <20230312022807.278528-1-vadfed@meta.com>
 <20230312022807.278528-3-vadfed@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230312022807.278528-3-vadfed@meta.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Sun, Mar 12, 2023 at 03:28:03AM CET, vadfed@meta.com wrote:

[...]


>+int dpll_nl_device_get_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
>+{
>+	struct nlattr *hdr, *nest;
>+	struct dpll_device *dpll;
>+	unsigned long i;
>+	int ret;
>+
>+	hdr = genlmsg_put(skb, NETLINK_CB(cb->skb).portid, cb->nlh->nlmsg_seq,
>+			  &dpll_nl_family, 0, DPLL_CMD_DEVICE_GET);
>+	if (!hdr)
>+		return -EMSGSIZE;
>+
>+	xa_for_each_marked(&dpll_device_xa, i, dpll, DPLL_REGISTERED) {
>+		nest = nla_nest_start(skb, DPLL_A_DEVICE);
>+		ret = dpll_msg_add_dev_handle(skb, dpll);
>+		if (ret) {
>+			nla_nest_cancel(skb, nest);
>+			break;
>+		}

Please fillup the attrs for the object. The format should be exactly the
same as for doit.


>+		nla_nest_end(skb, nest);
>+	}
>+	if (ret)
>+		genlmsg_cancel(skb, hdr);
>+	else
>+		genlmsg_end(skb, hdr);
>+
>+	return ret;
>+}
>+

[...]
