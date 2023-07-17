Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF369C001DC
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jul 2023 19:49:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbjGQTtt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jul 2023 15:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjGQTts (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jul 2023 15:49:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C490A134
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 12:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689623342;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=m2rRzgR2bCR4WLQV/L/SdDZ43J6JQqvM6vx+FxfFLaM=;
        b=diDjfU9CXSvx68l1dL+Fe4xHM4vKyehxrva9ZOOKczT95qdCM+cieE20qgKDUcFc21pNQb
        NFaRRdms++L41gLVBd0c5DlNW0pR/Xb4Ioi3m9OiBt/UM9AI8CzpHagtk/aseAXtr+6B//
        Z3npEIFd0FKJ0pcVo0qGM8WztJGRpIs=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-4SO-voxZOYyJPphuvJUl4g-1; Mon, 17 Jul 2023 15:48:58 -0400
X-MC-Unique: 4SO-voxZOYyJPphuvJUl4g-1
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-440cb3204feso674407137.1
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 12:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689623338; x=1692215338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2rRzgR2bCR4WLQV/L/SdDZ43J6JQqvM6vx+FxfFLaM=;
        b=j05UxmCUEzyjmx9LlQb+JVm3KHcgMT6zZQnMRx94PEpkSaRyLF1ufxIc4rXFsbMSpW
         Ya6sUfDcTsImeaSMvUb15kCj5C9MOwzJT06VFCx/L59AfnB5nsmg+RWSLmyRy7cUXRha
         DUvLs0aaLIRzPI6vIVe+2dKsTPWL5CF/9tlFlNFdoaQErQXii5eiwfyToxuIHLIs6b80
         5luSn9cZDi++WLyLgpi1CYbT+wCGN44ksPj/d6q6xUx8+/DYmcGjHvFiOi7lRyZdXl/O
         B+RZez704o+ogamzj5kHElG6LqAdnBFFiJZAD0u0OKGlEuID4yAoGsbTUNiT7BcsiP+V
         3qEw==
X-Gm-Message-State: ABy/qLbfZJt3gJmKZoQceNHSdS76MMKqYdr/MhXFgDQp4lAQSpQfzQ9Z
        WGPAsF1soydk5jQE5Wi6nCtDiWRb1ewowGkyB/HjfSJ4RCn71hbzQNhJDDU44NOJhHys+cYO6yS
        geaodmS9Xyll9ksVGJ6vd
X-Received: by 2002:a67:e3a3:0:b0:443:5ec3:55da with SMTP id j3-20020a67e3a3000000b004435ec355damr5207084vsm.15.1689623338328;
        Mon, 17 Jul 2023 12:48:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEmuKfhqUNybdA9S/7JJsY6kGCiUUlRIJFJBn/SN8CN1hqWuSmyjKp1TapgDjsKCWociDChlg==
X-Received: by 2002:a67:e3a3:0:b0:443:5ec3:55da with SMTP id j3-20020a67e3a3000000b004435ec355damr5207071vsm.15.1689623338093;
        Mon, 17 Jul 2023 12:48:58 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::17])
        by smtp.gmail.com with ESMTPSA id g15-20020a0caacf000000b006263c531f61sm154184qvb.24.2023.07.17.12.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 12:48:57 -0700 (PDT)
Date:   Mon, 17 Jul 2023 14:48:55 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [RESEND] clk: qcom: rcg: Update rcg configuration before
 enabling it
Message-ID: <e2xxoobnbtepdsplh2wv6l7k7snncbwssp43pttii4xnjj6egy@r24o4s6klhs7>
References: <20230712014812.3337992-1-quic_skakitap@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230712014812.3337992-1-quic_skakitap@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jul 12, 2023 at 07:18:12AM +0530, Satya Priya Kakitapalli wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> If rcg is in disabled state when clk_rcg2_shared_set_rate is called, the
> new configuration is written to the configuration register but it won't be
> effective in h/w yet because update bit won't be set if rcg is in disabled
> state. Since the new configuration is not yet updated in h/w, dirty bit of
> configuration register will be set in such case. Clear the dirty bit and
> update the rcg to proper new configuration by setting the update bit before
> enabling the rcg.
> 

If I understand correctly you're saying that without this patch:

    devm_clk_get();
    clk_set_rate(rate);
    clk_prepare_enable();

would look like it worked (i.e. clk_get_rate() would return rate), but
in reality the clock is running at whatever the "default" rate is.

That sounds like it could use a Fixes: tag if so!

Thanks,
Andrew

