Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA696C43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 09:36:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A67F620854
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 09:36:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O8egVEo8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbfCSJge (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 05:36:34 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40400 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725290AbfCSJgd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Mar 2019 05:36:33 -0400
Received: by mail-ot1-f66.google.com with SMTP id x8so17063531otg.7
        for <linux-clk@vger.kernel.org>; Tue, 19 Mar 2019 02:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QeF0MxDJ3McD0W9NSYKXvM9xJ3Mit9JkSEJosk6RsAs=;
        b=O8egVEo8cMZWZzeMuYakpBWN5igrHC/MOq8Gv3vTMXeLfRJg10bBXtwEO7By1Dmlaz
         5Qgz6ZQjzgpT165L4VjncpKC7x68j2XZ7hbwsgx4u4d046kJkkPU91/MvDHNhjQvB27p
         7G39u2OPB3JYMp/cCRDIJma2vHRh194LkeklP+qSllE1LoTZ8csEzFqVLPpYAfTVcnBX
         WEuR5986b3vUKzs7GBFYiUFphERJUNxNpzMyIixyY/JVHWHxFstYlupx8NHF4ooZ3w98
         rVjMb6Fz/sfKRngYsSto4R6Z/idskcOn0G5YkMLBrT6dvRfrv95NMBUzjz/LyFDILwqA
         song==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QeF0MxDJ3McD0W9NSYKXvM9xJ3Mit9JkSEJosk6RsAs=;
        b=fi39jjTL513tksYIa256l3AdN41BmSMUpScK9pMOvRxJa4awzMg6xGPi7K5SByqPj1
         hYfZu6qz9jtMbIT9NFbBDZU9hV+ac37LIGyp2PZTg1v+xDgi/zHbtu69YERvR3gvUn6y
         XFefynBfW+7dNtRZ2osEbS7L1ozxPLoACVqEl+hr//rjH2Pf1UYevVh0qkFSQoxNtmGg
         sr4p04GLANKAHpBlP7rbj7d7Z1bydQaY/0uhhhtF2E7b3Ej+azyVpRD9uj1BGxG/O028
         V7cN8gfseQrKg5F/OiPn5Pe72nR/e5ZAfqVPtpLEJdD+ErX3zpkzzLXJGiguQTvdB4mU
         BBrg==
X-Gm-Message-State: APjAAAXTVH9i5fsoPUAr7BXyMRtbMQNqofouCecKz61BzfqYuxTfQdNi
        vqaCoNLNgdcDA0ATJbq/8eRIPw==
X-Google-Smtp-Source: APXvYqxqSntQMEDXUWKZXFnG/Bvfslw7NYRq0Z8VZwWC+uhXwJ2IyKZCtODG8Pu2fmVW5LO7AuzJvQ==
X-Received: by 2002:a9d:63c9:: with SMTP id e9mr883055otl.76.1552988193296;
        Tue, 19 Mar 2019 02:36:33 -0700 (PDT)
Received: from leoy-ThinkPad-X240s (li808-42.members.linode.com. [104.237.132.42])
        by smtp.gmail.com with ESMTPSA id i203sm4912794oih.13.2019.03.19.02.36.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2019 02:36:32 -0700 (PDT)
Date:   Tue, 19 Mar 2019 17:36:27 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     stable@vger.kernel.org, Zhong Kaihua <zhongkaihua@huawei.com>,
        John Stultz <john.stultz@linaro.org>,
        Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: Re: [PATCH] clk: hi3660: clk: Mark clk_gate_ufs_subsys as critical
Message-ID: <20190319093627.GA22877@leoy-ThinkPad-X240s>
References: <20190319075206.30740-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190319075206.30740-1-leo.yan@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi all,

On Tue, Mar 19, 2019 at 03:52:06PM +0800, Leo Yan wrote:
> clk_gate_ufs_subsys is a system bus clock, turning off it will
> introduce lockup issue during system suspend flow.  Let's mark
> clk_gate_ufs_subsys as critical clock, thus keeps it on during
> system suspend and resume.

Sorry for flaw subject in this patch; please ignore this patch and
review the new resent one.

[...]

Thanks,
Leo Yan
