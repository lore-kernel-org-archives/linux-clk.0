Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A04135F184
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 23:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789168149; cv=none; b=TmntMF36kpnKH607zKpNhEKznlAV1xsCKnM+iDWflM3c7cdXURl/8rgm4M1KglguPHG67LsH2sQ8eV8wTHNAzfF5ZwZiFCxSqf5Eu+waRIvpCoVpybKXp+qz98bsUOSzIg39uoRRAvnKSbpDkmD9JpeBysn9evPO5EOvA7h98Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789168149; c=relaxed/simple;
	bh=ueMoS38D94aOUCZabe7u/Monic6ziSOlP5pUtoCLHdU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l/izBTbR0AOdA+I2YZFCXj0wP5V19vpNgmbGIiQEEa1/2bVhafgkcA55PcWgLQtuCi/JyTWvBe6y90aHJlrpO+T5dRhwKxQTCf24R0LuY00VhQBSdoBeQZo3NbkmMQW/u1BVQDk4VRgK1bQgYLedPDMhOkJaoZ7OYyuLeBQE1X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=itIYlWeL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=topzliSj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="itIYlWeL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="topzliSj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789168147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pSoRsWAHS1TRlan9esp4cwyH1YHqpyF1I7ErADSAjOI=;
	b=itIYlWeLxvUytae/j5ZD+xAQNcJ9+hfyyPAg4POE304FWKgMvI1tHqhOTfwZA2kwIGYaov
	6W41BioTxDm2WRVCKCFs4Syd/CiX2DCj3Nd9uenCYERNgve/FQPq32aMT9ocMJd9pZrtsR
	F9JoxFnMNmbzuMqUCh1jo80UoSBgp0E=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-xjzKTeLqOuqyGRW7FLNBNQ-1; Fri, 11 Sep 2026 19:09:06 -0400
X-MC-Unique: xjzKTeLqOuqyGRW7FLNBNQ-1
X-Mimecast-MFC-AGG-ID: xjzKTeLqOuqyGRW7FLNBNQ_1789168145
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9104ba8bf51so34099626d6.3
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 16:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789168145; x=1789772945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSoRsWAHS1TRlan9esp4cwyH1YHqpyF1I7ErADSAjOI=;
        b=topzliSjB8S+xObNda2yzYUMq3Py7cRRSA4v0FehJf5MuMwtXU+8ALKUu+Pw/zkzBR
         ozNtY7zFIqHxu7z12nCGonBUsUeVVVJqD9fqDgLrSjdOUk5w3/d/2nLOpAYHrLCsWKmm
         5CRYy4tO5AK3m3zyzABTXIimjOgLJkrpU+r+IkkmTYtSfoe6Akp16ZBTVQIoEb23zepS
         lthE5Ygz4/j0q9cfZpEGknlwacRpMVIlBM5plVV/wQpLN8Om6uggJPCGLJbrbnjiV8rn
         4zCVxxRkQ/vXbXc4jx5UgmQ4ahGG/NLyNFiQul3UnOHgAA8wkkdch+B5ypGHd3p37tsS
         xIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789168145; x=1789772945;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSoRsWAHS1TRlan9esp4cwyH1YHqpyF1I7ErADSAjOI=;
        b=J1kN+BEKMxXGFB6YIcyhqSlGfJKHK/tqLFBkX5YaI9nhLPZVvmCOasmdBkODvFFf5j
         p0BIuS+L0Zn+24+QRSJ0+qRyx2cjDvLfNfCtK7eZ4xi40s248aasIFOLBonnI7xsexg/
         Izufn6JxaR1FDBfLwGJiTiIx5WHSP2JnXrAbe7O6CyyOfc5vVulBKo9x7g8E8TXBa06Q
         2Z7+juCqiQsrVyWqyT7F1oAy2apzsJtTLdk36KZy9OhnTJKiSo2me/y5iDSkYux4z20k
         M0zzwdG/6xNeCmw2UEnSvcAwMv9WKY3CLcd2/AgUT12bzEFPpOFlSZU5sxidkH4Ge8EE
         C6Gg==
X-Forwarded-Encrypted: i=1; AKwUvBx91xW+/sPaPKzpADePYMtvaHI5ruaPTlvyfhE0qXgaJVOsT1gjV/a/picA947sdDbBN7uwG5Kr4mA=@vger.kernel.org
X-Gm-Message-State: AFuF++nZqy9Q9res3LXjsAKWqO1m/JCPEcOd41txtVS4lJQos27ojlNA
	MsGudayb340V20e/5qeXa/W0kmDD4F9UNk+ciu4TLfXZI/VZfl2NMrnBcHzLhT7HmRpcQV8oUjr
	nwPvSWdqzbxN1GfXRCADwI7Jm6IqCzuCr5E8lf8ng7erCA6roUZCW2ebZWYdkBuBVrTjV2XTL4q
	TF98U0btbsqCib8rgm5ye1BFnR2tk1EKKOYQeywpuoFGpF
X-Gm-Gg: AYBFou1J3MBOhCsut+ywQJlPcWWib0jh6SmHNGYx6gu+UJnf3GAUmS8+CsCopGtr78p
	EjM03zgYTKP3XORkOnCtDSYHU0S+PsK+PncX3IxW07A9o3CS1RpDed5MobDn5FpTQHDb+0f/hAS
	uqO7KwPAP44f82gX86224rg1AS6CQYCo4GU6pWswkmC7kmPHnK60nI7zFYZyb4m5y6M37ZwTwOE
	OtavO0tRdiuFYTPMfwg/LUEvi46qRHlWBxtpLsN604GcFhpbMFviSWvXKikTRsEWID6hI4fbTC+
	0TRVHnh7C6IF7f0tXv71lrYwcz246IUiDfSWdl3zpIinqWeu36ZxcPwWrAWTMuuDcRsF0Pc45nD
	L48kVjPL2NYjuxdjOPdIOzpc2Fojb6jgXoM0etlF/
X-Received: by 2002:a05:6214:43c4:b0:910:63b6:fc60 with SMTP id 6a1803df08f44-91212088ac4mr110557206d6.11.1789168145585;
        Fri, 11 Sep 2026 16:09:05 -0700 (PDT)
X-Received: by 2002:a05:6214:43c4:b0:910:63b6:fc60 with SMTP id 6a1803df08f44-91212088ac4mr110556676d6.11.1789168145136;
        Fri, 11 Sep 2026 16:09:05 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45cb06sm31876726d6.11.2026.09.11.16.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:09:04 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Andreas Kemnade <andreas@kemnade.info>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260909-v7-3rc-omap-fixes-v2-1-83e95e162330@kemnade.info>
References: <20260909-v7-3rc-omap-fixes-v2-1-83e95e162330@kemnade.info>
Subject: Re: [PATCH v2] clk: ti: composite: resolve parent clocks by name
 again
Message-Id: <178916811940.770750.2823922556711724746.b4-ty@b4>
Date: Fri, 11 Sep 2026 19:08:39 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=330; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=2GpGJ8FvOxDKSMB/oauE5IClSIRZ2XkprqOxmymbc8w=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKWdPFM36FxeLma7OzTDyoPbpcz5n2Qn9gSPOvQ3BeX3
 tRenjPhUEcpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQAT4djNyHDbP7LXdybLi3fF
 FuGKjvU22w4ftFMuvrHaIPDD4o2XhVgZ/hkL6r23/nv8+dvNMxN10qc/2hd83OPg9snp896xhPz
 K0OEEAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Wed, 09 Sep 2026 14:16:36 +0200, Andreas Kemnade wrote:
> clk: ti: composite: resolve parent clocks by name again

Applied to clk-fixes, thanks!

[1/1] clk: ti: composite: resolve parent clocks by name again
      commit: 59e0cc31cc5c43586c6eaada62c2c863bfbcbfb5

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

