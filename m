Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52532874F5
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 19:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784229363; cv=none; b=Q3dF0e0G4KM/xl6bapW7TeBqA7y1wQBD8tK0sAT7TJcWV+oZ8w6i7lqygHH2EEPKn2MdzUFhOwsJFE7uEbGFHS2jsqJD+f/ERXRBOJxxg3podGwlToHss2jfW8Q4j77WC47mba2755IUMlSSMGITt3FpFIgRuQ8bOrZ+SJdk89g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784229363; c=relaxed/simple;
	bh=d5ie8U7cPhn27p+Igsr1dRGiF11f9FBY6Gx2zGXVHCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdXl61pHugNLM2mUJR+XyXUPvnqTFekNds9QSgH0WT3T2E4da0haHMgRLkiSIRJlfFTv3KC7U4CF9OG0L51VSFStz6bBSZuz4Z4BPR8faxHRGaKmoHFP8TE9MmikMcOPgMIboQV0cR88CtfuFj650sjEM/2bRZZ812ffuKXBlz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AwrSvAoR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IPL5kEGf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AwrSvAoR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IPL5kEGf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784229361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ww0rJdn3hOUipKhN03+UND2dQfBI3wYOfiNLleaoT6g=;
	b=AwrSvAoRivy1n7rW7MOMT+8I6nm8gcPzsG00ymfdFCIj5RyMIdm07O//0YGfTxvyUATry5
	MaLao8sD6Xq+NCAZBlHinyMfx2vmcFZpvAYBkQbDf/4SzBOYGS/z1X7MH9q7115nbH1sB1
	TPsMXjccQvHMLzlZHnkG0a8SflUG5t0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-y5cSULybMW6ing6QE8tDiA-1; Thu, 16 Jul 2026 15:15:59 -0400
X-MC-Unique: y5cSULybMW6ing6QE8tDiA-1
X-Mimecast-MFC-AGG-ID: y5cSULybMW6ing6QE8tDiA_1784229359
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8fc92c5373bso115183016d6.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 12:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784229359; x=1784834159; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ww0rJdn3hOUipKhN03+UND2dQfBI3wYOfiNLleaoT6g=;
        b=IPL5kEGflFQZSwD2ySXm/inblAgD1LYs84Mx+9FKouYRSpGp6uAiRJmQ/jsk7W+j6s
         bwBOEXkBs4CPzey7ncNguVCyZyyUMFkj/2aR1Jkv/PiwWQbL1t/iVgTYJZINe1kcUwkD
         ddfutdIug03dq0HU9VuqjLwrJrRIyN0tlaNgO4NSwNJ4CzqaHghLlKhi62tGRATHrb2g
         di28qOAH46e9hb/a7SeeQRu4pFkH3l4AHAzSwIjb7Zxczq7NCT6xkR1+sFbBSoWKoKer
         JRwvme8+aRu3FFaN4/XKR7cQ7Tk/gq1NbYIhuPda9LGPc9d13z/HQ8TuaI2VEKRNwXE0
         PyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784229359; x=1784834159;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ww0rJdn3hOUipKhN03+UND2dQfBI3wYOfiNLleaoT6g=;
        b=s6+6xrcVp6+IDGz7zkJ6ZUrZQlFn7Rfr0K85/dk39o0zZ4QUWbLyBf/XcmOpCVFsaw
         SbeEVr1vGvzd6D0duryminl9+MOkIYM3iJADW6NzHLg/m3mB+kOsniZnv2YQvCk2uDwd
         +wNX6NTkra9PcfRtpLmSsUfga4mObhnieS3nhnJeCthsN6yPFBxt+giXoOvdEI6tyKTa
         NVcgQR4aKb478IhdTrh/4LKQP82ubXwVIsDC//bixrLwyp38JZdNQxbNd44f7aKjpR3C
         LXxLppKFJOylFNb9t/RFFiUu5DQhaMTd+4UR9FGjk1ElQTrSN9QVQml5PwGpbA3XSSec
         tWvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUCBjl1DuYqSDqPnamGhVIhWBc3SaPeAiB2NsbPoRqcZ/J1wFsiiwilhYD3P423hXO8azKI7lOHwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbyhMP03rAlYmsR5Zba+Ra0BioGey2qumY+Pidhl2lYYS99BON
	sMCZQOCnVlTFDl0CzXFSy5GcM3bJT+3bf6Elajuoqw+DbUghNx3/MOupJ5nQkYZlP2Bj3LMoFO4
	Co4Q+PnrDO3A5PymrpcW68NYb0BhvMysol+86cOGOxXj85Eho38uCUMeV049t+Q==
X-Gm-Gg: AfdE7ckFEDXFQ+ebB4+GNOI1wUnSvktcnHdetYv2oJsJ7HUZco4QY3jiRzlB8qHUmvz
	QNUdVEGFAYzrVfW8+HhWBaKPzZrfmNuybWMJnuUvQwERMVGV2FnNZ5wwSJyRNgY+hs1x+kPebX+
	nkir9JwsHg1W9YBi63z3KBF88qbe8OOMTw2r08IF6xYMVjkJOD6XFzbZlfZeOEufHDxKzHs0kUk
	tW2B0C8BkDn2ESbuZb+AYiRGhhk26leH9U7ozv10qKEVDwddI+nIwOc8RVOEvx/B5T9Hrn/yFgA
	YSPYrtaOQw6AmhoUZ2R9LZoU16Cjqw46Wn0KOCpNjGNUHHuZe1tnPRI+8wg7nmCiCTroV20RucJ
	MIbMW6sT9YlGakr9vbq/d8elaURXoJPwfFuU=
X-Received: by 2002:a05:6214:20eb:b0:8ce:e651:5d63 with SMTP id 6a1803df08f44-90758de2fc2mr99117106d6.31.1784229358942;
        Thu, 16 Jul 2026 12:15:58 -0700 (PDT)
X-Received: by 2002:a05:6214:20eb:b0:8ce:e651:5d63 with SMTP id 6a1803df08f44-90758de2fc2mr99116606d6.31.1784229358362;
        Thu, 16 Jul 2026 12:15:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-904116650b7sm204511816d6.8.2026.07.16.12.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 12:15:57 -0700 (PDT)
Date: Thu, 16 Jul 2026 15:15:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: qcom: Drop inclusions of
 <linux/mod_devicetable.h>
Message-ID: <alkt62x8pmKE2aKi@redhat.com>
References: <7b6441aa3b0dba35112ea486bfea3b3171d8527b.1784225976.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b6441aa3b0dba35112ea486bfea3b3171d8527b.1784225976.git.ukleinek@kernel.org>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Thu, Jul 16, 2026 at 08:21:05PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The only used symbol in these four drivers that is provided by
> <linux/mod_devicetable.h> is of_device_id and this is also provided by
> <linux/platform_device.h>.

I don't see it defined in platform_device, unless I am missing
something?

It looks like the reason this compiles is because of this chain of
includes:

linux/clk-provider.h -> linux/of.h -> linux/device-id/of.h


> So drop the unneeded include which brings us
> one step closer to removing <linux/mod_devicetable.h>.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

With an updated commit message:

Reviewed-by: Brian Masney <bmasney@redhat.com>

