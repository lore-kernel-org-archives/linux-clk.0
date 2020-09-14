Return-Path: <SRS0=A1Rx=CX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7729C43461
	for <linux-clk@archiver.kernel.org>; Mon, 14 Sep 2020 21:03:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F2CA21741
	for <linux-clk@archiver.kernel.org>; Mon, 14 Sep 2020 21:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600117429;
	bh=SypjIqhaRAC/Hpu9qoLX8d3WE5HyLBR3TQQ8FVbPLPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=NxTI43FNbc5QKVpTX9NLQRqVb9YrN1wkaHGxsdAOn3R2+uITGY8Xf5oWDFuTKSBKV
	 a4txG6hdoH99LP0IkSSB/ws7DAT5ExIualViRU1ZfG8+pS4QHo3mOeQYsbUweN2E0r
	 zRNzcs9iNWGpd6RZuc1aQ8FwhIMdMdbSdFtPdHLY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgINVDs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Sep 2020 17:03:48 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35780 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbgINVDr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Sep 2020 17:03:47 -0400
Received: by mail-io1-f65.google.com with SMTP id r9so1711022ioa.2;
        Mon, 14 Sep 2020 14:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=42ZSJB4zkHMkV3UxCc9fM8A45SS/gLb4mhmx7e2GiHE=;
        b=sVlMm+WvtjaH5oEIIaf0/DqQYljdb+pRDyKmag05uAbdXWbzidkyoEsLSRqsMHfYmT
         SiF8aOw/Wp5W6/bkwMlJ0GAorcy2VTlqiB42mtCpACqakmHH9wdVnZTKiDAyZA2VFrGu
         B+wRQKbrybSGIJO+PHo+TXfesxPWpDyX9QagpGLwQOJ8vnwTLtzhADlDPB67JptD5/QG
         FHIG6xGsuCNyfH55d0iuigJ6a0eTyig89BqmbpOkaB/WvGMMMbFm4EifxZoiqEn8KiV2
         725GMl+tuDyJnskndkhrfEKQSu3cx1Zx7C9D6sez32bna/PPG5EtlQyln/ulhHKdYyh5
         1FAQ==
X-Gm-Message-State: AOAM5326Jey7ZYtxu2flcKxtl3OGGcz3G8OS4Ig8PdL/uIBIvMyzIRSR
        5N2LnAt69FilEG4BVAYHBQ==
X-Google-Smtp-Source: ABdhPJwjzg08mCm6nZ/yIMnBAmdWCJqdM7CkVBuBB3YWHvxiOIZIJWp6J2ptG5APTZVJw7I+fKcWGA==
X-Received: by 2002:a6b:d908:: with SMTP id r8mr12833249ioc.21.1600117422535;
        Mon, 14 Sep 2020 14:03:42 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id y90sm7811685ilk.48.2020.09.14.14.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 14:03:42 -0700 (PDT)
Received: (nullmailer pid 244291 invoked by uid 1000);
        Mon, 14 Sep 2020 21:03:39 -0000
Date:   Mon, 14 Sep 2020 15:03:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: clock: add SM8250 QCOM video clock
 bindings
Message-ID: <20200914210339.GA244232@bogus>
References: <20200904030958.13325-1-jonathan@marek.ca>
 <20200904030958.13325-4-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904030958.13325-4-jonathan@marek.ca>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 03 Sep 2020 23:09:52 -0400, Jonathan Marek wrote:
> Add device tree bindings for video clock controller for SM8250 SoCs.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../bindings/clock/qcom,videocc.yaml          |  8 +++-
>  .../dt-bindings/clock/qcom,videocc-sm8250.h   | 42 +++++++++++++++++++
>  2 files changed, 49 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/clock/qcom,videocc-sm8250.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
