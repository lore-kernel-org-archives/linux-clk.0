Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A403B0AF7
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 13:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148933; cv=none; b=laPW6nnej8HxInZ6CVsR8WP5ks/d/OCtE/yn0AbIjnGyanMtDUGsqBjJRXTVCtK0p93PLlF1fXZ/GqyhSIc/JKUIABxxI3iW1TQP9bz4PLhNZV2eOhXgDRFSL/FNdFpLePGx9/8GagyGG/tdxbuE8qEanMGFEWTHt5VgDcfshz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148933; c=relaxed/simple;
	bh=7C48eJwQxF2SZSyojjO4eehKdtPdDBqSboD/LkVXOwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEF8v/YWWhRYWzTQhVF2tnv+Mb12TtEDiDBglIPqyX1H2ov1Rowhi032fP7Yj0iR+ZPbqlhPd+NjVmOun3bmdoBs6NtTaLCzRmIm61eUfEnd9vLBh3aThZtPZBP9FQKpask6k1AKQKCdd4+alu700Ky2K7MH7sozSaemvaA2IW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zo0CYay3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DLhvlaPb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zo0CYay3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DLhvlaPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773148928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5/adDEbR57gUpYJcJq84OoDVxrrM3xMPFmZCRo0jKXM=;
	b=Zo0CYay3fNS6nNUgO9JjxVGq9cPty8oV+Lr9ojdybQ8yTkOX4mN9U3Jy00cnf/ksl5lySC
	yySxefhsO579pYAHU3v/+4/Km7BtCaevJSSgvrsHg4X0Gz9yvYwnOWWC6jIDZFWyj++WtH
	+b+fK8uNDufV9iRkUqAPcaEBErJYWuI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-HJAY6PMhMa2QYA_il-xU6A-1; Tue, 10 Mar 2026 09:22:05 -0400
X-MC-Unique: HJAY6PMhMa2QYA_il-xU6A-1
X-Mimecast-MFC-AGG-ID: HJAY6PMhMa2QYA_il-xU6A_1773148925
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7ea0bb20so1450836985a.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 06:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773148925; x=1773753725; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/adDEbR57gUpYJcJq84OoDVxrrM3xMPFmZCRo0jKXM=;
        b=DLhvlaPbwaSFQKg/FmxemLJJZifDd7cIIhpxvIrZaWROKjgqKnQK81zS2r/WSu9mvZ
         1x4TVLhhO06glvOYJXTBYTQHe1C/lCEECiyKmpprEGkSpnbhT/+Xy+wfN5x6paEUKxsd
         eleVUcWebznHZRscghpqRSurxi7A6fJyr8+SC/oFm4tth2mVEOc19JKZit9S00HY03E/
         XNzQnAGkguTRFL3rrkTJWt1Ev4Xq7DVoDTHr6r9kNjeVPxV8v11X5FGr4E58NddnvLYv
         QUA4HTbgZjVMx4thX/P6FGMyY+HUc/G2+EnczacjtLqtmfpojjqt59bZxWNPmXy2pn5x
         ulpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148925; x=1773753725;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5/adDEbR57gUpYJcJq84OoDVxrrM3xMPFmZCRo0jKXM=;
        b=Hpgf2dKaDgUouB7UyGSRh0WxMDPCyQO7tXiNGXeeBLx9gFNZmCTGxyJkuzVv+xHG4R
         QvmLpCGgTtmi/mZovDZLuQw6iqyjvdnqMT/SXBoWCkMu4D7zxIyb/zXEbQB8X9IRCV8x
         MwbSpjo6AUtyBoRqOGWavcSqlR+Svwoy2cN1PvNrVcNCtVJfQxPaCQBYouyYlTRTZhwY
         WsnHR79BwTg9ToDG8phKuRCa1kn73tUQFmazb+2Z0HLok8NZr1I2RDHvdPcez6T/xOME
         OtSNzfBwx/mYz8/kUfiz8AJafudyeWWFUsjQwPAKqrIt8bVkLuDsYNGxk6TZ0n/pD8UQ
         OLNg==
X-Forwarded-Encrypted: i=1; AJvYcCWvq448/9zpNNPSEFzIV2aVJiUBxuvHyl9C12KyFtiUSvqaGdQiT/dnK2jCeWl11cDBrfojkSrntb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkY1JROmrxUv7JD8mwY+pTrLCbb4CiR8LBxNmNOnK9C6otxzv9
	ij99kAkngZcb1p49W8nn3CYHaI0VB29bwb1OgZ89iUtpk9RvRuQOFaENxsKc4ABWVLx+Wid70kN
	AfJ8Ygsn8FAd9Gdok449KIksRzDuq9vZgq1/ztEj5Bhv66ms7n6Dy2/VKmKZL/g==
X-Gm-Gg: ATEYQzyp/20Y2C/Ad4AtfgoYWCIiTJE47/lgveN2NZ+eTANhdjh+jMuGCMQe3iGIQqw
	seLOalarTqq+3TS+RQwklDvGF2U1sNaMTXZW73vF2iwBOdHAB9zmiLT7+hySbSAlaWGablqZ4g2
	LPBBLN+/HFuQRN2ylGEn17ujBknYKNkmiUQ76ahIyCcu70dxaymXN3X4PKGGlsg0Lea/bLz37DD
	I4dvz0TTtTz9RT4QRb24j6D27/O/KhVTZINXDBa8E3YskQlDvQMc42+yk1wTOZEvbcsjHHz1JVW
	ONn3Mng6AxXjzHyjicuUbYjcg8Yn6IglabDNvcN72OvshKUYzOUaUHWsIueY1bdj5ySbuFBaJTV
	DYv7DAJYccRr8kmh3Nu2YU5daRrs+7u+npz1qxtLA5FPM4wo3OgslIMnZ
X-Received: by 2002:a05:620a:3713:b0:8ca:1240:4991 with SMTP id af79cd13be357-8cd6d4f9469mr1830783085a.45.1773148924629;
        Tue, 10 Mar 2026 06:22:04 -0700 (PDT)
X-Received: by 2002:a05:620a:3713:b0:8ca:1240:4991 with SMTP id af79cd13be357-8cd6d4f9469mr1830766185a.45.1773148922638;
        Tue, 10 Mar 2026 06:22:02 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd8576db0esm474754485a.47.2026.03.10.06.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:22:01 -0700 (PDT)
Date: Tue, 10 Mar 2026 09:21:58 -0400
From: Brian Masney <bmasney@redhat.com>
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
	bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr,
	dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
	sched-ext@lists.linux.dev, target-devel@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH 56/61] clk: Prefer IS_ERR_OR_NULL over manual NULL check
Message-ID: <abAa9vQg4BSxl1BJ@redhat.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-56-bd63b656022d@avm.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-b4-is_err_or_null-v1-56-bd63b656022d@avm.de>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, Mar 10, 2026 at 12:49:22PM +0100, Philipp Hahn wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Semantich change: Previously the code only printed the warning on error,

Semantic ...

> but not when the pointer was NULL. Now the warning is printed in both
> cases!
> 
> Change found with coccinelle.
> 
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> To: Daniel Lezcano <daniel.lezcano@kernel.org>
> To: Thomas Gleixner <tglx@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>

With the minor typo addressed:

Reviewed-by: Brian Masney <bmasney@redhat.com>

