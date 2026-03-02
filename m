Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A066642DFF6
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 17:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772471490; cv=none; b=QGxyBXl0IuED/NJ2CfSv3/U1KjT4mVve0+E38iLIDGb6lLje+YH308jMXfxOSXnUz2pD64huB2o5MZXUNMS883varmRPIjQ7Fj82OggOtOmxD20QM3lkWAy7NpUodmobL2zq0PmnPkFlBhRuoc36ReYZ2reyUeCWalohPiBuLVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772471490; c=relaxed/simple;
	bh=Lds6rOZ7X/3g6xC/UqVG/xiT2+rkqLBII+J5UpiKeEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tagtPfJ8QcFR6CZWAu1n8I4PQN/n1Zl/iggr/XvYBctzzyXjHNknWxQprobBIsvijVmBnvYPwZjmCK4AG5b7qzzof0zhcjaO/XT1kilt1Cl82awWkb++wN38sdYcUa8Xwh0iCvd9cMasUhpyDFz5n7fP5RLFd5Yn7YZIEyCstZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A3ZOVilY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=efAO2olH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A3ZOVilY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="efAO2olH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772471480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dTT0P65qbG5CTQSoBKTT9PgPPtpnw8OX1DWXnZ+KTiU=;
	b=A3ZOVilY2d98ppWsTwrVLfdOqYhWl9KF8Ob1FvP3OK5Xx6l6XNSrwbdK4qFpggrGLeONwf
	w3dTZLE7wuXyDYpFeM7KfPXYWoTRZKiTvVIsPILFjBEwQ9RV0T9chOUdy3UodMereadq9G
	g/VseJjy02GGvOJypLe41tUKM/BgJxM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-Usp9OtlqNCKlCx4hj4m6GA-1; Mon, 02 Mar 2026 12:11:19 -0500
X-MC-Unique: Usp9OtlqNCKlCx4hj4m6GA-1
X-Mimecast-MFC-AGG-ID: Usp9OtlqNCKlCx4hj4m6GA_1772471479
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb5359e9d3so3785286585a.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 09:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772471479; x=1773076279; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTT0P65qbG5CTQSoBKTT9PgPPtpnw8OX1DWXnZ+KTiU=;
        b=efAO2olHnXWjbEwSzNJ9zmXzNimkl4eB8P5Cys0iWbvE4onmeeMgZiVV36RhKxbKJi
         DlkgH65lX9apaQM7M3U0sX7FiqyySd3TuAMea2lFBrhyaYVIDMNhW5gZj2DshozYIrGV
         prTjzmFNSTKr9p0jdTpc1fXT5db3tpdqvRAeyNY4Mem8Wa/YY1oELZrpAE6vUZwppUIy
         BdEjyvz9mjAg+WLpIUQoIWb5EADn3iy76Mi22BnMEFNpMk58DOrokfqTuvC/KVfxXQoe
         R1nKb6eOkDLFXLPfNB5my7IK69cfMQAW85hg6YslsG53VLYUeObz3ix3jahtl+sfOwgG
         v6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772471479; x=1773076279;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dTT0P65qbG5CTQSoBKTT9PgPPtpnw8OX1DWXnZ+KTiU=;
        b=EO2cybimZk46JO1e3KtoISKZWkXZJu6Y1k8R1E4WsPRM6xtw2dikCMGpuAj4a49Ge9
         rbJD9E687u5NSptfQEK+3HdIG2a2qv+2EaRpV2E664KWjEIe+CvtONnjg5uCFWIuaQ+f
         /6NxS7/aWeEcyk+fZQipqIDTRo7nD8NOsLFu7Unwox/WJxD5n0Km7zlAKUsJ/vRlmbTv
         xLfat6Xgyidkb04CeON8aDRm9NkN8T0hVB1IjLkPqa2iKtGBiEzDexyh49yQweYUo/aV
         hmkrbZAb12nDW9D+J5EoSdiM8rpRxqgtlbvwVmGPHhkdONOhBWz8qacnThIBXhD6CiRP
         mK0w==
X-Forwarded-Encrypted: i=1; AJvYcCWBIC3SyB0m8a8w4ooE91SC4l9nkndttjqI1Kn+GdeXrRyNnTK18GZvrKiZlMNecK2cXyhFOkacJk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNLraCgHKFl37m8K10Mawlh9vEGc3kosWUJs2kfcQNfdAwvvFd
	aPXwSpoYCTccqct3om1waUHCq3uqLy0PF5P/skwzv9q+nVYZqdIy6ukqg9buoG9JQUyMjgmV9dZ
	swLRenHpDHv8hG/ucSCtqyo00ENNNdgZEVmbOPUTSn+mcMcRhTmfjEnNVhgLo9A==
X-Gm-Gg: ATEYQzxqgEKmvLLK4G+cu8inMQN5RIb6dw1jZu5yA18mJp2kfPsCJtTzPZMEQkfc6MA
	LDg8dPX8ICQ0qbbHrvOo4XlvtYFqfVXeVMwIo5qTKuAm9PhsVgxaJYruGAyBmL7kAs30N1s1cye
	RD4PjreJUau72/B6DK9TKfGhPeJ3+Cak4Xv6JAAjmXdNAs2xf6Y+075BLfFjhnWIvsL1HcVgL4j
	YUpPeYiIJGYx/v9HoQe/ofp2QgzpP9+HfMXH8bXwSa7l+SjCgm57uccbVsFmaiKedvHr5EPXcQm
	c6juAxJEVw2LY6XTrbyJwFObNoQ3NtInNd6aXmhIHK44gOjzUHl4BpM0UwngDTVHslGRTe+Rz9/
	qVvH0idcM8N6hguH392DZgzfAqTj5k3OrWhFtFG+y3SHRYTb3gjsp9EkD
X-Received: by 2002:a05:620a:28d6:b0:8c9:fb0e:ca43 with SMTP id af79cd13be357-8cbc8deb20fmr1599860585a.24.1772471478980;
        Mon, 02 Mar 2026 09:11:18 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:8c9:fb0e:ca43 with SMTP id af79cd13be357-8cbc8deb20fmr1599855585a.24.1772471478512;
        Mon, 02 Mar 2026 09:11:18 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6534f3sm1172998185a.5.2026.03.02.09.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 09:11:17 -0800 (PST)
Date: Mon, 2 Mar 2026 12:11:16 -0500
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
Message-ID: <aaXEtNilpRYhwmYc@redhat.com>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-3-cristian.marussi@arm.com>
 <aaI9JBwWaMmfBbd/@shlinux89>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaI9JBwWaMmfBbd/@shlinux89>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Sat, Feb 28, 2026 at 08:56:04AM +0800, Peng Fan wrote:
> On Fri, Feb 27, 2026 at 03:32:16PM +0000, Cristian Marussi wrote:
> >Use the Clock protocol layer determine_rate logic to calculate the closest
> >rate that can be supported by a specific clock.
> >
> >No functional change.
> >
> >Cc: Brian Masney <bmasney@redhat.com>
> >Cc: Michael Turquette <mturquette@baylibre.com>
> >Cc: Stephen Boyd <sboyd@kernel.org>
> >Cc: linux-clk@vger.kernel.org
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> >Note that the calculation logic in the protocol layer is exactly the same
> >as it wes here.
> >
> >@Brian I suppose once your CLK_ROUNDING_FW_MANAGED sereis is merged I can flag
> >such SCMI clocks.
> 
> Per my reading of Brain's thread, if ->determine_rate exists,
> ->determine_rate() will be used.
> 
>  	} else if (core->ops->determine_rate) {
>  		return core->ops->determine_rate(core->hw, req);
> +	} else if (clk_is_rounding_fw_managed(core)) {
> +		return 0;
> 
> So unless update scmi_clk_determine_rate() to something:
> --------
> if (clk & CLK_ROUNDING_FW_MANAGED)
> 	return 0;
> 
> return scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
> --------
> 
> It maybe better to update Brain's patch to move clk_is_rounding_fw_managed()
> above the check of core->ops->determine_rate().

The clk framework has some basic sanity checks in place that are called
during device probe to ensure that various ops are configured properly. I
could add a check that if CLK_ROUNDING_FW_MANAGED [*] is set, and a
determine_rate() op is set, then it gives an error.

[*] Note: I am tentatively planning to rename that to CLK_ROUNDING_NOOP
in v2 in about a week.

Brian

