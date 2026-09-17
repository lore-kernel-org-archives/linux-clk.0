Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2154CDDEF
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 15:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658414; cv=none; b=acn25+41Q6ssbgPk/lbDEDmiz2jT9TJ3FSKp4v4qa+CBUYKDQbEqRRYMTF7Xk94LAdX7vSTZmAQ7a5XQ0XUc65Ty+aRpS2iDtV2V2DLOsnKQfGXMe/2vndZ0svzq2Om6kg8OrGezjjrJqoKtHyGEZQaXGSZKIIdmMPCAyguujAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658414; c=relaxed/simple;
	bh=Pr16IcWXUqBGT/dN8eDlUegItuWHeJylL28MXbSDECs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y49lNHxQg6mhlpWLc1e5ifoFxDwUHKt4y2aTY6epwnTsvgocyZ2E1BLhlQYQRD3I5b/Yw/Ba5thd5mAFydWO5YM/7bZYxGBLg8VbLvpdvchW/UdA6lzrHrXcBXjMEZZviAK+HiK1SRB9pK68kC1oySxoPjRK5fF0sipisAxx7QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SzNEZPao; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RNrEJIlL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SzNEZPao";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RNrEJIlL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789658400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GB+o9a7/ALUFm3hEwLKClWS3yWNFMi9GdQLNbpiNa3g=;
	b=SzNEZPaoT9RYlMvbtG1cVm3nxpwBVkf8jJJeVtkAmwB9jQClrgKCLhGlh7Gtg5Sr4eiS/4
	QPaAvY/+4ySVOJWk7cblaz6zax0aYDJl8WlBTm4GGfn18IK0cx4O/jQU9hQXbiZd7zS9l7
	SsIbvb7ntNv5ewu8qirLgwq8Bcbon5o=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-F8r76IhaN1abCOT3Xln8DQ-1; Thu, 17 Sep 2026 11:19:59 -0400
X-MC-Unique: F8r76IhaN1abCOT3Xln8DQ-1
X-Mimecast-MFC-AGG-ID: F8r76IhaN1abCOT3Xln8DQ_1789658399
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9104215fbdbso28859486d6.0
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 08:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789658399; x=1790263199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GB+o9a7/ALUFm3hEwLKClWS3yWNFMi9GdQLNbpiNa3g=;
        b=RNrEJIlL3wFQqjlJBoHjazo5aGk/ssPbMbjmKXFGRpk9kSoaXN0A+2KHI3Y1iZ6EUT
         oHPEGdMvI/kRD9I1QfGz8J5XUeesnIMm0namXZmI+QngJDHlH/+m18n66R/8Mpy2NVOl
         If100EvOOFLRqBMrA7+IxzwSFI4s7wQRGwqTpcruw3K6MaQ2ZHbN+OeUfztOPtXwPRCv
         tzkIJ78OyF7EJcea+bges/lun2aNapqrCgVXSt0CavcIpE2Sxzh+ozbP9XzNef3knVJx
         0dXSVwKGFIHWOGH4v2Ii9ZnMUqAXg6nR9PdSQVrz5w3A6ELhG+HKHzMy1DVkJDdvMIg/
         wkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658399; x=1790263199;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GB+o9a7/ALUFm3hEwLKClWS3yWNFMi9GdQLNbpiNa3g=;
        b=JNG2f9wTTvaW7ngbyxP3MLQ0xIWp+lE0PiP1gtteDgKNCh/5vjqLmoex7ppDXLLEFK
         kDnhRKyEzVYLz45bdsaxMp1yTpt6AghgPbFuTjBPwkrJG9QGyXdtMbX4IM2bwn6jlcG9
         qMZzB+grY1N6/+e/7nH4vOry+YvJi/nDOlBdpl0cL0cfiBJ/Pt2nPoYPXkZ1S5HEAi3N
         hK0O5kA4DFjsIBKAlutvbxNjQyDh0sAHuzlmJajqKWr3rMFSYqpXk+OaiOx7rVCp4WZF
         B4TFdmWBjHq1CNTXF0jMq0bYgP9Kpq3VybN+R0bN6D9SBh8VbCUru5c4CMJVEnXaMUgM
         +Iow==
X-Gm-Message-State: AFuF++mz4v379XFXQTQ+DaNyqFbZv2dWXUHfH5WVqjf/Ir0FyBB1NVOT
	5jRvwvzI05gzhmzw8elq5+VB2g57CehTSEawAdr4LZLKCTxwaJv6ADVdYpflys19LSdHeZLpq3H
	qYB5T9LGyfIlCvDgdqUxQGPyf7vZyJmfxLhl3dVRnOFaTR5F0taSMAiv8ZS29MpncI60dMQ==
X-Gm-Gg: AYBFou0QkwaX3pLdRxtcjCfedQULyWHiMAHq+g0077PKfgBBa8BIsQgR1Kz9+qKlIcZ
	yXHM2gNcWrnKtyDMBj0d9/1bH3TIHaOSKt3AGOYBj8RkAkoB1p0RBeJuOW0HL7xp2vENGE4fV50
	9WBC3nlTwUbKLbG/uTApEcw+0M1vVyQMRhzqJjJmajvZAMOxOUy+RhPgztliPWZXoeQgCcioYC+
	lqGtor6OcIZltBXxykZuDxXV9KbIPAXTghwPXW7WDMYZeVGBtW8Ei6AkIYubkJZVdUYdYeWGCzh
	j2u303ocvnPFH2XGL4kinimA/n1et/K1wqJW2XljZ8kNdcmSlm+qCZToYq2iHKEaimtxh0l7rOH
	2wzY2A+T7IdZjFjqUen15RKJ9ggI1OLUx75sgTJo=
X-Received: by 2002:a05:6214:4002:b0:912:518e:aac7 with SMTP id 6a1803df08f44-912518eaec4mr13974936d6.58.1789658398561;
        Thu, 17 Sep 2026 08:19:58 -0700 (PDT)
X-Received: by 2002:a05:6214:4002:b0:912:518e:aac7 with SMTP id 6a1803df08f44-912518eaec4mr13974046d6.58.1789658398069;
        Thu, 17 Sep 2026 08:19:58 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252cc99a3sm112666d6.33.2026.09.17.08.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:19:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260912000527.231245-1-rosenp@gmail.com>
References: <20260912000527.231245-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] clk: actions: owl-pll: cast delay to unsigned long
 for udelay()
Message-Id: <178965838714.360090.14541070378650623903.b4-ty@b4>
Date: Thu, 17 Sep 2026 11:19:47 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=329; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=GhNGxMokUfeR99zQB1+878eEK+CdEspBfCwGd+WWdEU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLWsEodOb+q38dQ7ICrtnytw02ZbZM5hFwlOly9ZjB83
 bTAegZ/RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOZYsbI8ODp/N58l+OBDnbP
 XvKbdj6466NvutF54qImySWL7T/l+zD84di17bXvo7nP/tQ7zY917J6/uNx/Spzc1eYjni/e/8l
 YywUA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 11 Sep 2026 17:05:27 -0700, Rosen Penev wrote:
> clk: actions: owl-pll: cast delay to unsigned long for udelay()

Applied, thanks!

[1/1] clk: actions: owl-pll: cast delay to unsigned long for udelay()
      commit: 46c51c413242870a59f64d3c11df25d6693f6fb6

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

