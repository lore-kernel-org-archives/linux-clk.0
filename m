Return-Path: <SRS0=Glxp=Y5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19593CA9EC7
	for <linux-clk@archiver.kernel.org>; Tue,  5 Nov 2019 06:51:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD5E720663
	for <linux-clk@archiver.kernel.org>; Tue,  5 Nov 2019 06:51:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ovFzPiyu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbfKEGvG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Nov 2019 01:51:06 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42426 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbfKEGvG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Nov 2019 01:51:06 -0500
Received: by mail-pl1-f193.google.com with SMTP id j12so6927810plt.9
        for <linux-clk@vger.kernel.org>; Mon, 04 Nov 2019 22:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MLZvtTZXNfvRWFvhu+xZrbhbWxZa6520w7xc3DnxMfk=;
        b=ovFzPiyueyG5Yh6NS3lam6dcbSJjihEjm+M4xFDqkGmjUXjx//55rawC9WZoTAjUsu
         A2Xy1v2lrnDeGPeUC3k+4sEuLT7/yKwKfiYk7xxItUg8cYGd1fI4ySLpzzPY+vmrqM5l
         JjI20g8GwXjM0iQlF0516Cs1zx7PREOSiY5GOCJGmNAIZ3UXdF50ntGkynitHmrg4Ns2
         StTckSIMgd0t9xWKYktljntLr2DHLTVnGbeyDo6pVMh7Xve2n4Jz9ODdatcMI3zFZU6g
         /Lk+U4N0JDLfXsHuBZl3dAPUcPkKNQrv+9kSj9KRdQECaeSsuKbIb7jhX3RYakGm4+df
         v3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MLZvtTZXNfvRWFvhu+xZrbhbWxZa6520w7xc3DnxMfk=;
        b=aw+k2+ZbFan3IxnZ3kFth1CiFciYirsePdfsV3O4jB1+YuU5d+lalCTB0fbxkvCKNu
         fhMh23+PAbhEm/zRRfv2a2AeA+wKVj3vLKG6SS1x+G62xFx3YuktcwqRc56nVhWxvnWO
         yD3Da5lH+czPvF4w9/CrwJOlXtx/8di9751Ft1k5lcDZfr/WZh5blxo3KljNbLAYd7Vu
         BHsN26Zp0UKf7shBj9yJK5m6Q27n4ayIrjLIPaGpXG50zUsBJvYwI973WE+Zk7hMcy1A
         4cnPKMvenxbgqoaHbUapBXsNkLCY3kaEBhVoZOLtFB7hvU8teA8ayT03/ZBMACdmpw+f
         rG7w==
X-Gm-Message-State: APjAAAUCpwIJJ+gucNtf6Rk42bhGAnK1SMplzScopusmoE+bmT9aEeEB
        7XM74V66y+esIOUcj/Z9pELN9g==
X-Google-Smtp-Source: APXvYqygTQR1HLlTaiQfWLrNs7Ep8bXeQMuApptnCYjO/5t+FBUMcOI0Th7332U5KHVlcuUUK4d/pA==
X-Received: by 2002:a17:902:9a03:: with SMTP id v3mr7331351plp.61.1572936665309;
        Mon, 04 Nov 2019 22:51:05 -0800 (PST)
Received: from localhost ([122.171.110.253])
        by smtp.gmail.com with ESMTPSA id s69sm7227648pgs.65.2019.11.04.22.51.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 22:51:04 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:20:58 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, daniel.lezcano@linaro.org,
        edubezval@gmail.com, ilina@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        tdas@codeaurora.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 5/6] clk: qcom: Initialise clock drivers earlier
Message-ID: <20191105065058.yhqgvilti6cdzph2@vireshk-i7>
References: <cover.1571314830.git.amit.kucheria@linaro.org>
 <5f1ca3bfc45e268f7f9f6e091ba13b8103fb4304.1571314830.git.amit.kucheria@linaro.org>
 <20191017174723.8024521D7A@mail.kernel.org>
 <20191018060345.wjflngfdnqa3gbsu@vireshk-i7>
 <20191028172225.1B1CF20862@mail.kernel.org>
 <20191029010605.GB27884@e107533-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029010605.GB27884@e107533-lin.cambridge.arm.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29-10-19, 09:06, Sudeep Holla wrote:
> On Mon, Oct 28, 2019 at 10:22:24AM -0700, Stephen Boyd wrote:
> > Quoting Viresh Kumar (2019-10-17 23:03:45)
> > > On 17-10-19, 10:47, Stephen Boyd wrote:
> > > > Quoting Amit Kucheria (2019-10-17 05:27:37)
> > > > > Initialise the clock drivers on sdm845 and qcs404 in core_initcall so we
> > > > > can have earlier access to cpufreq during booting.
> > > > >
> > > > > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > > > ---
> > > >
> > > > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > > >
> > > > Makes me sad again.
> > >
> > > I am wondering why it makes you sad ? :)
> > >
> >
> > We're playing games with initcall levels :(
> >
> 
> +1, which will come back and bite us hard soon :)

:)

I don't like reordering init calls as well, but only when they are
used to avoid issues and probe things in a particular order. While the
only thing we are doing here is to get things to probe earlier, which
isn't wrong IMO :)

Lets see if it bites us anytime soon, I would be surprised really :)

-- 
viresh
