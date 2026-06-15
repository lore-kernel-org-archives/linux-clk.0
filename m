Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5605B3FC5AC
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 14:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534897; cv=none; b=ormtJz/J6R989SUs1/eHNd5d+pbWhMr0hJaRKBZ4gPnMMT/Im04KBpd9e5tCQp7KkZbrXPM3vP3S3gl4Nlg/HW/FYelpYNEeeEZrIkkvaIxn/5jwNeMlr+0c+JU2g8tC11Qts3Zz3sJ0UurF71CKDoTg2AKLrZ//+MxBZiLRvww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534897; c=relaxed/simple;
	bh=YlzTVkLgMbpd2FCLrWB4gEgTde5PLvSJdXVzWSc/UuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0VXQX6E6QJ3TQ2xSghzurCxkbLY0wc6EwMkp5lis0wpC3SiWcLTogMRLaUSFrQw7nmoSXNMw0AAiLWrHGAszDDP/9eKU16dRVuMiqgX2Chi8krmAgAxrA38Nq/iratM43wzYLP7jK5yn+kmEF6rBHj0KwjwAXr751DawkjTe0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bw+wPxEZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=L8di3A2H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bw+wPxEZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="L8di3A2H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781534895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LYUiP1zUOQ/ECnZLKF5f92a9iphW3H0XPbp5bN6qB9c=;
	b=Bw+wPxEZ8iuBqOoOh4mYL5+B095PtaJU1SKBm49H97R6ATuS1UJ7Pc1ILI+QujaOBSLtQ4
	AzCHD/MgSBzfidezYssQswz0veBRRyZvd27qo/O0Dv1LsQXcLtPRxdTN9bZMwOkx1j2AGA
	js0r3SyhPitL1kkP7+ebZJ3/5+VvQhk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-Z-nd2P_KN3idGH7sQuBEzQ-1; Mon, 15 Jun 2026 10:48:13 -0400
X-MC-Unique: Z-nd2P_KN3idGH7sQuBEzQ-1
X-Mimecast-MFC-AGG-ID: Z-nd2P_KN3idGH7sQuBEzQ_1781534893
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cceaca5671so74698476d6.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 07:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781534893; x=1782139693; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LYUiP1zUOQ/ECnZLKF5f92a9iphW3H0XPbp5bN6qB9c=;
        b=L8di3A2Hu6sgp4J9xjSRqzrwQFIQvK/9Z5tIxTeiMUS50EtX1n/mNDG+Y4R845y1Lw
         HSROk6uLetpnUz8RvWJcFefc7ajBThdLBKUZqd9DeeSp3rYul5Ur86IbmFzcOja7XorM
         FzmJpVH5gSt/f9EQgzw9BtGV1S+xkra+DUE+1L0JuFGbWgBgA501IzkDi9bng+zXgaXv
         laS4aib4YWNwdgDKW028c5UxEIT0Dzjm41co6gYiKcY4sr5V8EZx0xUjShtOSN87msh9
         m+E0wxghr6oS7Gh0JGOAZp30n+qglL8yiaKfpfTi7IyrLdCqOGoHFL2My8fvMkpp6vJK
         XVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534893; x=1782139693;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYUiP1zUOQ/ECnZLKF5f92a9iphW3H0XPbp5bN6qB9c=;
        b=gtaiIB6QTK7tgQyVIDS4NqBKWUmKbgSlKzm8wjF5IDt4deyq/pWpdT4gcztNynwjwh
         688RZMIgKfE5lAITaRwTuy/VZvbiRL8J7hc+kL2sQ0apta1p5r+1L4Tttbl1pgfXuXWP
         XydlpgZ/Hpv5fSBmrNiJLuIcqEloH2UU7gfbW711eeJyPsuTcf6rdXQW8xTnizX79WQ5
         po+9Ndp4gijmbJPzsCsojHDQv/2lx4jGq9mYt0+jpEVp51y74cGNZ8X5gAHG+0Vrxhhj
         NVe5VjtwypGprSXxeW8KOe71rjeUDhySfkbQcClfqKolmeVETrvbqBB4BRrcYDlSsJMa
         fu0A==
X-Forwarded-Encrypted: i=1; AFNElJ9pVSZFrfNFSYcyWNsDd3apLqIMpL3ElrE5kvjMYVZbto8AmgGXSwYqWYphaRSAxYlpRB+MsBYq41s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPypHi/tHukHddg91ZdNHahtxnDIaS7VYOakK2quCL99EPoHD/
	kql6toqTcn6FAXmI+TB/N3kN8ZE/GWHzgsFbNvmTAOCmK/xp1F2s07Vjc6mgi5PA+mUMIoR1ieI
	YQ0gc3vvE+y8J+eMZBnfndDQhQeB88YaiFuN9F/L4aY3LujSKQtYP8lZmT85egQ==
X-Gm-Gg: Acq92OEHbrL5F16s/Qfx2lOZzuEREtGvQm4uSx6PBYttAZVHcAwKIlIte51e+8a72YG
	aMDo8IvdglQ/xR9XGRoOkKNbihZOfj2BE/oHFYcBMQpTrv0QQBezFJ32R1dgz3zV/at+WYF1gKW
	nrOzH8zaSnbIGSeZfU9zChEKgDcjvuFoo0DPjzdYcRPLxXqambBKiV5TE+XOAyaUFz5mAQLuQtY
	GtmjZRbZzZGHNURJD/tg/xKgXLbBvQo5dE2k4IeI4FOyHfX//bOwd3eK84JSui2kJTAKMpFSr6K
	vyErR+KqbBoFc1JM4zrdfcLMBpY99JA1KdgBN6T9bnNb0reZNx7+SZfOLGcWj+kaw/x8psljaoj
	E1uIxs6Rg6f0kyllCsZ1MOQ4ft+MtYpbp/DOjfdE1vJirjz4mI51rukL3
X-Received: by 2002:a05:6214:c2d:b0:8cc:10ff:cebc with SMTP id 6a1803df08f44-8d32c012972mr6347126d6.7.1781534892441;
        Mon, 15 Jun 2026 07:48:12 -0700 (PDT)
X-Received: by 2002:a05:6214:c2d:b0:8cc:10ff:cebc with SMTP id 6a1803df08f44-8d32c012972mr6346636d6.7.1781534891945;
        Mon, 15 Jun 2026 07:48:11 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f4557634sm259586d6.30.2026.06.15.07.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:48:11 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:48:09 -0400
From: Brian Masney <bmasney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Val Packett <val@packett.cool>,
	Saravana Kannan <saravanak@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bjorn Andersson <andersson@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: common: introduce qcom_cc_sync_state()
Message-ID: <ajAQqVB_knGO-bqL@redhat.com>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
 <xtrvgetj3ybwuceez6mymxw4cwa6sqeycoz2hs2zztozeb4oyb@uuhtzbludmzv>
 <2f6dbc37-7ee5-4cef-b39e-455494fb31fd@packett.cool>
 <ncgma77ckduno5645xf2hcmakmbpwub5d54p4zcrhz5pbq3pij@o257r3t6p5aa>
 <ajALNcLMlTThdilX@redhat.com>
 <68a86037-bba0-4cab-8a1f-b0be78f259db@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68a86037-bba0-4cab-8a1f-b0be78f259db@oss.qualcomm.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Konrad / Dmitry,

On Mon, Jun 15, 2026 at 04:33:17PM +0200, Konrad Dybcio wrote:
> On 6/15/26 4:24 PM, Brian Masney wrote:
> > On Sun, Jun 07, 2026 at 01:30:03PM +0300, Dmitry Baryshkov wrote:
> >> On Sun, Jun 07, 2026 at 01:43:06AM -0300, Val Packett wrote:
> >>>
> >>> On 6/6/26 8:15 AM, Dmitry Baryshkov wrote:
> >>>> On Wed, Jun 03, 2026 at 10:21:47AM -0400, Brian Masney wrote:
> >>>>> Several qcom clk providers currently have a sync_state helper set to
> >>>>> icc_sync_state(). With an upcoming change to the clk framework, if
> >>>>> sync_state is not defined for the device, then the clk framework sets it
> >>>>> to clk_sync_state().
> >>>>> [..]
> >>>>> @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
> >>>>>   }
> >>>>>   EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
> >>>>> +void qcom_cc_sync_state(struct device *dev)
> >>>>> +{
> >>>>> +	icc_sync_state(dev);
> >>>> Only if desc->icc_hws != 0, otherwise it will mess the interconnect
> >>>> internals. You might need to set drvdata to desc.
> >>>
> >>> Hmm…
> >>>
> >>> Currently icc_sync_state does not seem to use the dev argument at all.
> >>>
> >>> How would something get messed up, now or whenever icc_sync_state changes?
> >>> o.0
> >>
> >> Yes :-(
> > 
> > Sorry about the delayed response since I was out of town all last week.
> > Just to be clear, the missing check for 'desc->icc_hws != 0' is a bug that
> > existed prior to my change, and I should label it as such with a Fixes
> > tag when I post my next version?
> 
> Up until this change, having icc_hws > 0 but lacking icc_sync_state
> (or the reverse) would be be considered programmer error

icc_hws > 0 but lacking icc_sync_state (or the reverse) makes sense as a
programmer error. However...

> Starting with patch 4, this gets assigned unconditionally, so there's
> no prior bug to be fixed

I don't see where that situation happens here. All of the places where
icc_sync_state() was previously called, the new code now calls
qcom_cc_sync_state() -> icc_sync_state(). (There is
qcom_msm8996_cbf_icc_sync_state() that needs to be modified.)

In patch 4 of this series, it sets up a framework level sync_state()
callback with dev_set_drv_sync_state(). If a sync_state already exists,
then that call will fail with -EBUSY, and it will leave the existing
sync_state() intact. So it's not calling sync_state twice. I will
clarify that on the comment.

Brian

