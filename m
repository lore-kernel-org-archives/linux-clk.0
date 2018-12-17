Return-Path: <SRS0=zTeK=O2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C203C43387
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 20:48:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2493D20874
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 20:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545079699;
	bh=4lIh/lGbd/CSKOzi9NoN4SIlGQegRC659jZ+kLWnMdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=hA5OvtyWlhATGKsdryH1TEMUqXMQBVstsgby5nKLqWAUecyNlASOXvZj3xrkNf55P
	 wu0skDnhFdcGz42ADHCmiszvNe24t1XpR84viWbdS2aFUt/kUiEI1oUu2rIfW6BVCE
	 NzyaZmULvDD8BR9WkYPgFA8HkjwMtMfeTIThaBJ8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbeLQUsS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Dec 2018 15:48:18 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34909 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbeLQUsS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Dec 2018 15:48:18 -0500
Received: by mail-ot1-f65.google.com with SMTP id 81so13523814otj.2;
        Mon, 17 Dec 2018 12:48:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ALEjEqIdwFSSRoq9RFWKX7LEDM9VJ+I0PfaVwCEVqzU=;
        b=NWCpaCs4XJKWFNBc2xkgyb9wDFvDs8bpdVypLPHcjDkke4VtLzLDcLmaB4POPHVlvt
         ED1RYnA3/VovZx5hhO3iOsT5DcP/wuR4C3PaxobMjVlMjL2uLfPkCgoxEKvrrfyyFpUm
         UTLsd0pDKVqBL3tNSJfSKSwIIPm4MXziItScMCX39ZVkfkg+SwdgPXJpvuwnLzy6TmHI
         I6RV2kmA9w4+2VBvYyzLW5zC6QvuWY6BdM6vBMm+31qId8FIzixLIIx1ZkWD4bgTKUwO
         7QJrw+N+uApYmK28ZgB8TRat7JSiZplbXj9bg1HQhtxEb/DMv+hrmBmAUJ5y7TPYP2Zl
         OiUw==
X-Gm-Message-State: AA+aEWbIfQo8gzwC6al0T+/m1k0MF4qTlmaWk+Lwc+lZY/ICNF+ikhQ+
        nOlnBUYiqgEqmA9S9rjx6g==
X-Google-Smtp-Source: AFSGD/VJi02c+EgjFNFEgNv1/7UWkXzE0vI+8N7yMr6AvJwJKJjiX0Ycec7UsXIv88iTOllhmBN8YQ==
X-Received: by 2002:a9d:3646:: with SMTP id w64mr9960542otb.118.1545079697259;
        Mon, 17 Dec 2018 12:48:17 -0800 (PST)
Received: from localhost (cpe-70-114-214-127.austin.res.rr.com. [70.114.214.127])
        by smtp.gmail.com with ESMTPSA id c78sm8896002oig.30.2018.12.17.12.48.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Dec 2018 12:48:16 -0800 (PST)
Date:   Mon, 17 Dec 2018 14:48:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Govind Singh <govinds@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        sricharan@codeaurora.org, sibis@codeaurora.org,
        linux-arm-msm@vger.kernel.org, andy.gross@linaro.org,
        david.brown@linaro.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 6/7] remoteproc: qcom: wcss: Add non pas wcss Q6
 support for QCS404
Message-ID: <20181217204815.GA17099@bogus>
References: <20181215103557.2748-1-govinds@codeaurora.org>
 <20181215103557.2748-7-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181215103557.2748-7-govinds@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Dec 15, 2018 at 04:05:56PM +0530, Govind Singh wrote:
> Add non PAS WCSS remoteproc driver support for QCS404 SOC.
> Add WCSS q6 bootup and shutdown sequence handled from
> Application Processor SubSystem(APSS).
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  .../bindings/remoteproc/qcom,q6v5.txt         |  61 ++

Please add acks/reviewed-bys when posting new versions.

In the future, please split bindings to a separate patch.

>  drivers/remoteproc/qcom_q6v5_wcss.c           | 544 +++++++++++++++++-
>  2 files changed, 577 insertions(+), 28 deletions(-)
