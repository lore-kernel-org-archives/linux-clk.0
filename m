Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4015932779D
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 18:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775587714; cv=none; b=DxOp6HYnme088I9UCl1TpY8IxKCWcTggVSlYfmC9wCeU665Fga7O+74iDhckV5EF6c3Muk1csywuNep2Bpc8hRH1mKE3Wdhq3fnQYRNTSfEv/yL2jlHqHg21uk9xe/6S3Lo7sT3oXcVuSOf+7CYzkFRTQgw2m9oxqn+URfkvfDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775587714; c=relaxed/simple;
	bh=x79Jav08+LwoUKWXg4HsvIeK4Ps7KKBZV548bW8sdk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NdXxs78RpU2avStfc1kf33YoU/5sYA6bSmU8Jc+69KGLNG2JD2O2yeNpcuhjpgydTm8Zu3K6Xn/6aQEglbnZuYs1j0auWppAOidrSDW4wcEpkxrgHo8yfed11WhopTsv1Wb2DFtHQ3KJDisCU9oC8OK28Hbi/4Y8UJzaIThY8DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NaHuCwI5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SEw7g8e2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NaHuCwI5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SEw7g8e2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775587712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Pnpb6SDZMkbPbYvs4u7AhPVopmFX/goNUB55645IGM=;
	b=NaHuCwI5QpZkg92vaVqvJs8CMuGbRzINrF4K0luLKoPBG+pLIE5Q6ixdlV/wKBB71bIeDW
	xeJ9WKrYcQjMScMjdoQ2CEShn/MF0eOO3m/2dy3TWIQDxYEMywfPS/712IhmZ5ovl1QvBa
	3awSPbdDEYIeQcN/XLtd0Hp9//IA4Xw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-j0vmwpwmPxyRKLXW_umN1Q-1; Tue, 07 Apr 2026 14:48:29 -0400
X-MC-Unique: j0vmwpwmPxyRKLXW_umN1Q-1
X-Mimecast-MFC-AGG-ID: j0vmwpwmPxyRKLXW_umN1Q_1775587709
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8950562d351so77068846d6.3
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 11:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775587708; x=1776192508; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Pnpb6SDZMkbPbYvs4u7AhPVopmFX/goNUB55645IGM=;
        b=SEw7g8e2gwM+HRIFZnsOkyJbf67kDquYs5o2ZQ5TtI72UvLFJ8F8Z3K7arGfBPg/qJ
         F+6zp+/ry0tgdi+o83942aeWa9Ni9lKrUyHXJSSz6soNgO3Y8AfQHfcDjiR5eswDKtew
         uyRKeQv3LlUXnuzTIo6VtJ17shT/ZRF8HAdnxKyvgU9KAfE5rkeYVzy7bboTtSNRSZXr
         fiHe2VqWJ8wXV8U1W+6PAGbdNXX/TjUl3pl8CRGiV62XE4dcbtEX6cu5ubkb2fsjd9SB
         wN/hFOX4FFfRjZx0a/PH6kL5OqaPhxRlcd++aciqt70vPPKWHWtdAr+J1W+vMIoW+U14
         Xxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775587708; x=1776192508;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Pnpb6SDZMkbPbYvs4u7AhPVopmFX/goNUB55645IGM=;
        b=Hzj2grNcD2Nd+RuHf/fJoCbTTscu8Sl4RAamN+C4ESy1y/kWSe2K1X7miMee60MCtC
         RldBOwdU0b01sErcmfhAvDJ/8b7roOpE11Sn0ZDDdCCqfVnVoroNuZp2x64Hd7zgZOnM
         UN81drY1aeamydcnvTIuUcT+YNAXxvIW+yzhGkk2ZmCjtPW5of7JI8Z2RBwgHR3I2gzW
         syJLxRu6BVXxm+Wkrv6xYq4DMk7ItpZma9hc1CPajfyUpJbcduref1/JEkYwNp/3d1ln
         VcxaXX4eQ4tDJTiUqDseZf2RolHB0Cs+9YiOATkv5SyZAaDPwc+XcVGWM+hozE+o9I60
         fVlw==
X-Gm-Message-State: AOJu0YyeDCYz+BlxcOvzNQ/Iv3y3O6+a31WIzfqLiiJ0OOp+iD9WMFCM
	FaQ7j6C5Ec1YhoKWG7emowLx2UIABpMLpfIEtjU5qeqUIGkQ7ySglMp+5BAF1AGjCG8AaIZNLke
	6uY0P1yhlgam8Sg9aA821jtUzrcOQeMp6fVbwbbXdAPsXUpATQT7LfpNBeIqSYw==
X-Gm-Gg: AeBDietNBbyahv/6tnhi5lAjXyWt2g7hlkREFQ6Hy8i2eezKr86EnIFUeEURGfH26Wd
	g8GaTL8mSqoahiD/GMjPJdcVi3aYRoGKGpTib/T4X+P4ncJkXvoiayV9X2WIG/P1YTb2dp9ouMk
	aPtpEaeMy6R3N37/S1YHuHaiXbmP7GJTsvES47k3v4OitHJA1t1CurxU+5dUCCNtFj78GE6Tynm
	AjZOz26FCchS9HbqyLdEtm0wXwj9xTGdTWP4HDgxDHdy7JFoZj6htTKxo1i8dhvDRIUvwkwRReI
	gh2XxTbH2sYnHoC6nwQY3w0tnUDfnlKI4Rqn4wDjwH7o/tufCJwBZ2+BqILx6UHVrF2vp9qref+
	t6DobyP23qj60UxehRqVS0SC2Z/xkSiXGkELaI5ryDo1nTE8sO7jLkVP2
X-Received: by 2002:a05:6214:8097:b0:8a0:d5be:2407 with SMTP id 6a1803df08f44-8a7026ae50emr265416206d6.14.1775587708533;
        Tue, 07 Apr 2026 11:48:28 -0700 (PDT)
X-Received: by 2002:a05:6214:8097:b0:8a0:d5be:2407 with SMTP id 6a1803df08f44-8a7026ae50emr265415856d6.14.1775587708110;
        Tue, 07 Apr 2026 11:48:28 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974ddccdsm155250326d6.41.2026.04.07.11.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 11:48:27 -0700 (PDT)
Date: Tue, 7 Apr 2026 14:48:25 -0400
From: Brian Masney <bmasney@redhat.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/6] clk: fsl-sai: Sort the headers
Message-ID: <adVReVTsoUwAUxd3@redhat.com>
References: <20260406215150.176599-1-marex@nabladev.com>
 <20260406215150.176599-4-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406215150.176599-4-marex@nabladev.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Mon, Apr 06, 2026 at 11:49:44PM +0200, Marek Vasut wrote:
> Sort the headers. No functional change.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

