Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AB151FCBB
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 14:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656915; cv=none; b=Ix1WmJqzc6BWLzGlnmbv6OMYitR1yEN4mShoa+cAzAtvHhrUt9P6O3eCI943dnHBRwccegxXCd1FwwI7tI2kbbsKVd3F7HZXcLlYOmitcyAoD1kPzIehwpvRJK62DsooUoyIUO+s3r2w5M+NtgUx7KoPj6xEfU6o1kTZRkWu2kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656915; c=relaxed/simple;
	bh=6mUCiPfgFcR53z0p0wqDnczQ1/FekAVwOl0ASYekEMA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uX68aphoAoe8jm9tDOftaxyvK0ToEeqvGMAGXcHX4GvcLFtwofCH0k8fFo+/DzXiyWuqcMuO/YydbVHJ5OC2aUlscK8YH/+tNnOBToHjdO6MW92Jb5TA2azcCBIplCr26Hjv6tRe6txU6PnFCnNLUrXc8MaH9mQD6eMhay+z2p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CCH0/CG2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LF4kmRhS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CCH0/CG2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LF4kmRhS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789656896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9AXFSc42fFXOGOg/f+O9pg18PTmXdnbb3QObGTFVGu4=;
	b=CCH0/CG2J2i7SQO0ljcrpOQPRF7gpyIEumKLRaYE4+I8Mjp65sx+jHPbFQnVTju+Tziszi
	9l8wRObz35FQflpOgOsHmoO8yZa/WvUmasjTFCu34rk+7Qs58dBs1deGchh4Bjgx7RNw87
	yCDypW4zuGUiw78m3IZlsRZtiEvY4JY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-PhWw6L0WNaa5qksySHuV3Q-1; Thu, 17 Sep 2026 10:54:55 -0400
X-MC-Unique: PhWw6L0WNaa5qksySHuV3Q-1
X-Mimecast-MFC-AGG-ID: PhWw6L0WNaa5qksySHuV3Q_1789656894
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53094ff7090so26212741cf.1
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 07:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789656894; x=1790261694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9AXFSc42fFXOGOg/f+O9pg18PTmXdnbb3QObGTFVGu4=;
        b=LF4kmRhS2iorgtdJ9GUMVK01qbt/noWh/hWZKD4h8ta2lILeuh/9APABpJnTSzIXg4
         W0kkw37hFDLtPxfGyBd5yavcDl+OQVYlGrf0NKrEkIzPU6c/pPnat+l6zE4UdW2OJxEb
         y5io8J0f5KeWgS35TJy9LY4xxb8n2Cgz80QGBZ31Gl0q4zOvMKgS8HnzmOXdc/tFd4ld
         G3rYCYtkwV8PtL3WqRJXE7JIl8ILasmUiKMe6hVTgxQ3w5xYkAoA1aFJOg/h4Azo2EyY
         l35km2RmZ4O1UeeezxYO6UPpDtyfCesyuFWxdx8Kmx3zQe60NIy1u0tajY8q8H+XJGFS
         4XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789656894; x=1790261694;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9AXFSc42fFXOGOg/f+O9pg18PTmXdnbb3QObGTFVGu4=;
        b=sg+1IaZ/7pru2MGAw5v6fcI2fsSi9Ugx12Hx5ESnCMr+XwlZRqnB6JsNpJwAYHg+h6
         jco9nWGVRZHMp6u1pZJlsgoaDZVkknVy/Axju8mPfQQAT44fnccJD1jXMiwRCJnHwAJ9
         N0+zSRpjciBZ5elvlXakKc7ClUpj1snwg/2Z+ZmQ1y14NtApaf0TxezR9G4bdOxR61dV
         am1ycea9riKNOt6JhU/3io+Q76oxtsrZ2cd8bFweGHvdyDxctiW6JZF4SglGMdhLMbqW
         0S7TaiT0Yh78Yt5o8U6zKn49qNt1342SzN1G4Q4Z7ifheoQMiM9CGpVdnTk5LfCK5McA
         4fXA==
X-Forwarded-Encrypted: i=1; AKwUvBzUhVOxXYrBDRS9jV6M2e9dAyobt0r6Pe8LSKO/uP07OsPl2WleE9Q+4fhTCmDxHHM5nN+pW13JzRI=@vger.kernel.org
X-Gm-Message-State: AFuF++nOGzi715Hrd5Gjl8S4QHfvs67bTmJr2qSrnltWFXRAiVQUfOKE
	Nc88NPmXk23g1G30SbqX/uTg3qy42JCPA5ZcQNdwVCGeYyqKS7oNEBPz72ZelJeAGb/7o2ZV0eo
	cbzUe+NPvgBzGb/EEiksShPXpstaCiV4tPtIYe785nQo1MO1XjSG3YAhk6ZTBeA==
X-Gm-Gg: AYBFou0XZtYwpufqzLklregq54JrMzLfBQr1nEAu9KaevWpJtlwhlG7RWGmFkhRufFF
	v3V4hkm+uIXJiXJ7NdCpu1wU3HOE405aigCGeAMUvpyD6cO2VoaJ/TTt4pckRP1cbKWJxM2VJBT
	k1uq+Dr2dQG9Q5x4cS5MVC3N0PyJBCZJfSJeXEESN+AgSgxw/PVCJO01iFmRPmQC5e5Uje3BIsO
	Mzj9rlwELyy1KAAwS5epl0EFMk64keLHbCQFpGB/HrWm0CMaX9Kd0xh+/hB5Ih+JzQjWzQUZJAv
	QFMmSwVetOpHIlNUk+uycmtrNDwuMrClp5eyWyFHR9RnZBCpC5P5dUtnuCTVw32DAUZgXzR/i75
	EbbhquGtAOpNFFuEl0dp27k8Ep+b8V3CY236uNrg=
X-Received: by 2002:a05:622a:17c4:b0:52d:f484:eefe with SMTP id d75a77b69052e-5327f54b73emr119219281cf.35.1789656894281;
        Thu, 17 Sep 2026 07:54:54 -0700 (PDT)
X-Received: by 2002:a05:622a:17c4:b0:52d:f484:eefe with SMTP id d75a77b69052e-5327f54b73emr119219001cf.35.1789656893856;
        Thu, 17 Sep 2026 07:54:53 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53259aee19dsm53067881cf.3.2026.09.17.07.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:54:52 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260813153650.44793-1-pengpeng@iscas.ac.cn>
References: <20260813153650.44793-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v2] clk: si521xx: correct the SI52147 OF output enable
 map
Message-Id: <178965684879.360090.5503590837229538426.b4-ty@b4>
Date: Thu, 17 Sep 2026 10:54:08 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=312; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=HRHMuNqDMyQ7VrNZVdhFpU18W+ly5/8zYF2raxiGR1Q=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJW/zeVuDNf/qB/xFU97jszO922X1pz33/LyflLGSdE3
 tQWy+pR6yhlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAi7HcZGb7MWfDfe++TvoQ7
 Ns99Ax7LGVn83DihZtWloKzWH9ERT1QYGba+rX9xN20F85R1W2580ZGVsL+4cIlXb1fLJKM1bOo
 lLWwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Thu, 13 Aug 2026 23:36:50 +0800, Pengpeng Hou wrote:
> clk: si521xx: correct the SI52147 OF output enable map

Applied, thanks!

[1/1] clk: si521xx: correct the SI52147 OF output enable map
      commit: 744e436077af1af06b38589d1e034e4f8ea7b3ae

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

