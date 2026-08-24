Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510C943FD1F
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787585383; cv=none; b=p7Z5aAYe+LbcA52ETl0jr7PV+e6g1K80YHHRjYJrOWbYYLHiEmJbCXGiMl8ih3brtvDwBlHbKsUCMyf9CmvD1ntHsHFWmCh0P1embGHwzx1Y8lqW3rSlHHxxJ+fF4NYW0Am+F3RS5P2zFZoIWp0FZh29k73vvJompp2OPmgUCHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787585383; c=relaxed/simple;
	bh=HWI3e9E0H1RApk6fXstUQ5pzjk2rBkbElJqKtYRiNH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tqmahx2YziuDDOj6FxqOIlu4vdO3OlFxYWkbfgNybHFjGrk016/NxxywHjGew8AYSxZxKGOg5ATl1IYrxpq0yjVxtf3KqplgaJMNmAdVYU7m0oeQpxOkanDvkwpvv2gIL7Chg5QOcZLKcuT848zKpbETJzjOUGWPH80qe0cWGNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IwnzX1KV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qA1GIWBD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IwnzX1KV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qA1GIWBD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787585379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/goNprm3vb+vqF+2+ZaUSBOvzdh+ZGsOcB6bvYFMahs=;
	b=IwnzX1KVuCiS6BhVrVdtrTWBqtMel8eVAOB9p3AUC5o8Nn0/Dns5nDsY22q+vu7B2GPxG0
	Ddi6tO0qzQrul+YCQtQ2vJrwlOTCh5q9FQW+7PqHOEWHb3gi3t2FWCBCvdTiNarnK3IEl0
	ktQWch1sxv+0sQFyFs8f6Wmc/Yaaikw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-71iQJN9yMQS8dgTTKgcBFA-1; Mon, 24 Aug 2026 11:29:38 -0400
X-MC-Unique: 71iQJN9yMQS8dgTTKgcBFA-1
X-Mimecast-MFC-AGG-ID: 71iQJN9yMQS8dgTTKgcBFA_1787585378
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90a60102d6eso25416736d6.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787585378; x=1788190178; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/goNprm3vb+vqF+2+ZaUSBOvzdh+ZGsOcB6bvYFMahs=;
        b=qA1GIWBDtQ0UFIf02rgCnPNQqvvbVnBb9qQQ4OXOVwSIyWnUk9x3RjDdISLXLvMSJc
         5p6BknkwRcfQBcAZgrvAEU9xRFUOC6V0ZqsgkLzaG+Lc86AIaL7JKO2w7R/M8W9uq1xj
         lqOtfAEYkhYvPBi0GRN1t3zZ0GlUMxW0/t0Wg1fuG9fBQLJV4PirDWUwoFFzxm4j9yDQ
         WuTSX5a1JFs/PG9D6NZDhyI5zxFzR9SCQfEmFZ60vJwW6j7i8B2i8bkBrG/Bgf2C0wJH
         vWmbf1641oP858Mh+uY4Dp31AxKBTTMgMevdEq/L/+avOWt4RnXk/Bb3oFxDVifgtCjq
         ES3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787585378; x=1788190178;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/goNprm3vb+vqF+2+ZaUSBOvzdh+ZGsOcB6bvYFMahs=;
        b=fESEn0A2dvDYEwJdE1qqJrukwnAk6ERQFUalM6PyZD4fW/hPaB5uDjyQVtWu7indTm
         fjYwha4qZ0OQ/7Y25ome1GmzLWPZs7WnUZFh9s9azh/uMMe520HN1S3uScxXAiGYYI0F
         ljI9ii6uBvx4T3D7EeB4BQlNvjCKdT4sNKH5sotcQuOmCAy+jQOMTlrJTE5ZJ8qTh0gM
         pswFcdPBWizDpQoQkgozHTRTHCZCATJh8OTU5yE0uvh3D2bieXeaYdTiH+rwVOJls1Gj
         JqxO6dn477Q3nO39ahtu0g9QD1OcRfQFH0tbW0ZR/Qj+k7tKIbgdPf8ijcnUSoiUYsMw
         rVPw==
X-Forwarded-Encrypted: i=1; AHgh+RrIOJMHIkaaNx3QwVjUE8gLZwLe/+N53TOxdni9/xkWQcov8dCnNd+19VZRL2H1f5asQlGjMqFEl44=@vger.kernel.org
X-Gm-Message-State: AFuF++nxaL5Th4IK4XrcPYTa8AYcbrgGdBnoE558g8FbzIXBFk/N80P7
	OPJChAsxhZewCr63VIE3ox257csWBZnPVaCJ9krwD9D0PbZfpO2S98ZgcicUNnhg8CtktHdbKiV
	cbGEUHr7jX1iTL6/ixA4MgLOUZDI+mU07X4QTEftPqKhysFKkiibk5Mv6MiECQA==
X-Gm-Gg: AR+sD11DPbm271efweEkmxl6lySrwrIQZId4q5/i2wpCUDLi5BtujuLTNonFt9XVZgv
	rL1b0qGsQwi7UdG7hKLvM2UFvKo0JnjFMixmBe1WtTmgWauzOm3nA+OoIvnP7nKwpjf3C0Jxuyp
	K6n1prfH0LHvQOmTtCHO1+b3w+QbsxGI6zxMrlrHXMMpdZZMvjEJZ8bGbtN/cyV+rcDeR0yNE7E
	ObnLtNEk6E8qi+DTehckAZ1Fx16YnBJzQ45u+hIWlA2E1O5gwpE1/ZIkeDrLoshLSdCPDetGXs+
	KNmtEi/Cnv0j46YdEdRU1t9glndJMnM5+RleBwa5unprEdYyBPQ5n80aZDRO9mHvD3v0OMUysbG
	0kRJSH2LqmeYKNuwqBu8qL/80O1AolXDgfSE=
X-Received: by 2002:a05:6214:212d:b0:8c4:edb4:a44a with SMTP id 6a1803df08f44-90c80f9357fmr293301176d6.23.1787585377991;
        Mon, 24 Aug 2026 08:29:37 -0700 (PDT)
X-Received: by 2002:a05:6214:212d:b0:8c4:edb4:a44a with SMTP id 6a1803df08f44-90c80f9357fmr293300306d6.23.1787585377513;
        Mon, 24 Aug 2026 08:29:37 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c936183d0sm65105676d6.22.2026.08.24.08.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:29:36 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:29:35 -0400
From: Brian Masney <bmasney@redhat.com>
To: Lucas Tanure <tanure@linux.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, Jian Hu <jian.hu@amlogic.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] clk: meson: t7: Intermittent boot instability and memory
 corruption on VIM4
Message-ID: <aoxjX3HabY0brgXk@redhat.com>
References: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Lucas,

On Sun, Aug 23, 2026 at 04:40:42PM +0100, Lucas Tanure wrote:
> While testing mainline Linux on the Khadas VIM4 (Amlogic A311D2 / T7), I am
> hitting intermittent system instability, storage loss, and memory corruption
> during boot, unless I append clk_ignore_unused to the kernel command line.
> 
> Because the failure is intermittent, I am running 100-reboot test campaigns
> to bisect the remaining clocks and isolate which clocks are critical and
> cannot be safely disabled.
> 
> As testing takes significant time over serial console, I wanted to check if
> Amlogic or the maintainers could shed light on this:
> 
> Are there specific T7 clocks or hardware domains that must remain
> critical/protected even without an explicit in-kernel consumer?
> 
> Current clocks being disabled that don't kill the board on a test run:
> 
> [    0.380313] clk: Disabling unused clocks
> [    0.380413] clk: Disabled unused clock: rtc_dualdiv
> [    0.380718] clk: Disabled unused clock: rtc_duandiv_in
> [    0.381377] clk: Unprepared unused clock: a73_div16
> [    0.381972] clk: Unprepared unused clock: cpu_div16
> [    0.382605] clk: Unprepared unused clock: f50m
> [    0.383174] clk: Unprepared unused clock: fixed_pll_dco
> [    0.383786] clk: Unprepared unused clock: hdmi_pll_osc
> [    0.384416] clk: Unprepared unused clock: sys1_pll_osc
> [    0.385056] clk: Unprepared unused clock: earc_osc
> [    0.385652] clk: Unprepared unused clock: pcie_refclk_osc
> [    0.386323] clk: Unprepared unused clock: eth_pll_osc
> [    0.386961] clk: Unprepared unused clock: pcie_osc
> [    0.387548] clk: Unprepared unused clock: mclk_pll_osc
> [    0.388187] clk: Unprepared unused clock: usb_pll1_osc
> [    0.388826] clk: Unprepared unused clock: usb_pll0_osc
> [    0.389465] clk: Unprepared unused clock: tcon_pll_osc
> [    0.390105] clk: Unprepared unused clock: top_pll_osc
> [    0.390738] clk: Unprepared unused clock: aud_pll_osc
> [    0.391361] clk: Unprepared unused clock: ddr_pll_osc
> 
> I am not forcing any clock to be disabled; I am forcing all clocks to stay
> on and letting them be disabled if unused one by one.
> 
> Any guidance or hints on required platform clocks would be greatly
> appreciated.

I have an outstanding series that disables unused clocks via the
sync_state callback:

https://lore.kernel.org/linux-clk/20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com/

Be sure to not have clk_ignore_unused in your kernel command line.

I suggest comparing the list of which clocks are disabled with that
series against your list of clocks above.

Brian

