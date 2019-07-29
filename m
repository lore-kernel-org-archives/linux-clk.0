Return-Path: <SRS0=VAfA=V2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F888C433FF
	for <linux-clk@archiver.kernel.org>; Mon, 29 Jul 2019 10:53:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03E4E2070D
	for <linux-clk@archiver.kernel.org>; Mon, 29 Jul 2019 10:53:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nlRmEDq3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387504AbfG2KxD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Jul 2019 06:53:03 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:39959 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387404AbfG2KxC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Jul 2019 06:53:02 -0400
Received: by mail-wm1-f46.google.com with SMTP id v19so53058972wmj.5
        for <linux-clk@vger.kernel.org>; Mon, 29 Jul 2019 03:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=AOLYj7vZFitbpFqErn7oWDZ99uADKiNehnmJGd1HBMQ=;
        b=nlRmEDq3Y+gorIJyMNrwNEssz/SMKtx/EbGSW+70sSXgCdPUXRRW4QFGNQHsrRjUHK
         yk5EhfB9I+l3OqcXJ6syW9AqVN+LZcjMiL0wfMXJmeaJwBw8oejQiKMoTz7TEw6O6FBD
         QBDIPtIRvfl6dXouSOlZuNHp9CEWKAJHrvL6tM/zsmkD+A/NkxTM9t5Ik/oe8pMn5I4F
         nIRTm4pXheok5sJZ3rwV/T5Xxx3GrySMKIK+d5JioDOucs7EFRHgGfXxJHzNiM/QmAv4
         xNR8HXqUjXERpIK8lMphDvUvO+f9oPuOdmpsj44RdUjxYrLGYHAN83FzDj0an1ZCSyUR
         L8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=AOLYj7vZFitbpFqErn7oWDZ99uADKiNehnmJGd1HBMQ=;
        b=Y40L9uDE2XhJC72xpBDAGn0PGbBF8xxLHv/j45LJPR9bun8hZV0WdzlR//Ux39Xljz
         NP78z/u5FJ+fuzI0lIFYVMecWjH90W9ee5btZreaZ5CHba4kSpFBYd7siv8mFdqtZxvT
         Id10S4Qw17wtS4SsVAXf7NI5XBcWlOmzMnr3XLq+VFiRMAW8nQqq+JcuCLiJcCtMOEoq
         vUmejG31uzOXuhtfNoBpg0sLalQRSJU8Yb4PoDT3ga40ss6jJ7xK6dYWzSS61qcxE0Bp
         WZhKWjc28RiUtL8i2kZvqg6twkP9f4LeGW5xUVjludE5GiM7U3J9sn3TUTTwd/GMh2kR
         kYoQ==
X-Gm-Message-State: APjAAAU7Kt/I78mnYHe8olhBNsbxkk1GSl5lCIIN6NfbkqfD8gKnmeO0
        0s4cQJcE4ve+JKdpjo71kkwcyQ==
X-Google-Smtp-Source: APXvYqxxAq1qeCj6RzXzLrMQuzQ7BjjgL2TJJi51jQeFJRGXJ36dozWZyeLAR3r9r7D1DIVGG85i8A==
X-Received: by 2002:a05:600c:23d2:: with SMTP id p18mr93454869wmb.160.1564397580031;
        Mon, 29 Jul 2019 03:53:00 -0700 (PDT)
Received: from localhost ([2a01:e34:eeb6:4690:ecfa:1144:aa53:4a82])
        by smtp.gmail.com with ESMTPSA id d10sm50464699wrx.34.2019.07.29.03.52.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 03:52:59 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Alexandre Mergnat <amergnat@baylibre.com>
Cc:     khilman@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        baylibre-upstreaming@groups.io,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH v2] clk: meson: axg-audio: migrate to the new parent description method
In-Reply-To: <20190725164023.27855-1-amergnat@baylibre.com>
References: <20190725164023.27855-1-amergnat@baylibre.com>
Date:   Mon, 29 Jul 2019 12:52:58 +0200
Message-ID: <1j5znl9kol.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 25 Jul 2019 at 18:40, Alexandre Mergnat <amergnat@baylibre.com> wrote:
 
>  /* Audio Master Clocks */
> -static const char * const mst_mux_parent_names[] = {
> -	"aud_mst_in0", "aud_mst_in1", "aud_mst_in2", "aud_mst_in3",
> -	"aud_mst_in4", "aud_mst_in5", "aud_mst_in6", "aud_mst_in7",
> +static const struct clk_parent_data mst_mux_parent_data[] = {
> +	{ .fw_name = "mst_in0", },
> +	{ .fw_name = "mst_in1", },
> +	{ .fw_name = "mst_in2", },
> +	{ .fw_name = "mst_in3", },
> +	{ .fw_name = "mst_in4", },
> +	{ .fw_name = "mst_in5", },
> +	{ .fw_name = "mst_in6", },
> +	{ .fw_name = "mst_in7", },
>  };
>  
>  #define AUD_MST_MUX(_name, _reg, _flag)				\
>  	AUD_MUX(_name##_sel, _reg, 0x7, 24, _flag,		\
> -		mst_mux_parent_names, CLK_SET_RATE_PARENT)
> +		mst_mux_parent_data, CLK_SET_RATE_PARENT)

Actually, you should have dropped the CLK_SET_RATE_PARENT above.

Before, the rate propagation was stopped by the input clock but now,
there no such thing so the rate propagation must be stopped here.

It was almost impossible to know without testing audio, so fixed it
when applying the change.

Thanks for this rework !

