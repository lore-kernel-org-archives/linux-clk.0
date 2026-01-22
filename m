Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603443A8FED
	for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 23:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769125040; cv=none; b=Vk661fq0JKy1UcAvA+3NnW09vDNAYZiXT+sDw8kp0KIAOe7oqsqi8eq1GTTXBfq1aMp+D+vUeGJog72D141vnBA88zF2ZlywHedJxTy2AfnltuWRznGVR3It23Qqj30dCw2kObpKxdTZT2K4+TPRcmg2464UjZUjLpjtrBYBxCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769125040; c=relaxed/simple;
	bh=M0Q9iP+jXucVN1CHDNHf/RjlOryRVGJXTcPTXRYVDvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpzmNFRZe1p/6P9anJfFns9x9+XYokGJUX4U+uc63Fe6IYiS9cVzi7yRtSQt82/qnPo3vbTlD8XnjWa642l54TyNv2zKfrtiVtbpYuJsK7hAKxvTYnMi09mVyjjoYI02FZ+U9jklW7rx4uts0zGjdAlkiu6bjxH1h1HjJXrzIuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DfWfya9b; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YjrzgYfW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DfWfya9b";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YjrzgYfW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769125027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9pL3G7JOlBAwWEQSSXv1PQeUeticFwv3Q/AJHR6+W90=;
	b=DfWfya9bIXTPcHjRvCEP1JLcbx/UDMMSRf7XCRDPM1ehy58UmJj7HS2mCpO3R3yScD0nZI
	0zOTWqSxitQdg2a5ERAPO9qfxMndcNlBN3juQuUfDrnQJqYlBa8IQKDw2k2VG5ZEVlVOIg
	vuEbDrJQa4S9Ph15SuGsv5f9F5Yu6lE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-NmPUZajhOo-ud10e64Gc8g-1; Thu, 22 Jan 2026 18:37:04 -0500
X-MC-Unique: NmPUZajhOo-ud10e64Gc8g-1
X-Mimecast-MFC-AGG-ID: NmPUZajhOo-ud10e64Gc8g_1769125024
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5029b0c3786so40364981cf.3
        for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 15:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769125024; x=1769729824; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pL3G7JOlBAwWEQSSXv1PQeUeticFwv3Q/AJHR6+W90=;
        b=YjrzgYfWf5dNwtU2RBsgLGqmq7Hp2SWKCQReWOXnUZ0BA/cfkLzwBzUT3xJHXSVhtu
         Lv9OT+NDqZesbcMh1AdqKZvrjyJOIfRMRTp2yc9ItvJknNtLoQNxpzqKEH+iJv9gNpYN
         YdaREcX8+/BYEUdP6C828ZSAv630zxOm39BL5ajQGo/tyWBK1y+Yp0kNIDzcINGjfPdM
         ke8FbMfzmNXJslTYQbRo7afGYPFsct7gnQ5HS690mRut1xqy8swhNnaQFtDXPJgp9geu
         xuLSPXl9XR178pxNSLP97gP0XFZ36OkY58FM9RiUWr5Xrlzb/Sa89eNQOgSHoVEY5y90
         s09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769125024; x=1769729824;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9pL3G7JOlBAwWEQSSXv1PQeUeticFwv3Q/AJHR6+W90=;
        b=HAojdjF48PpkO2y2SVF7To0L/pC22FE4/klH5peDUFNP7Z0rLzQBALszw3zrGBK5l3
         8QmqKj0vMxx+exYeR1JKhSf3YDRE7gzL2qDZc7IfjkBr4nRE0B3FwHOKvXb2h+OC6YIZ
         ZIknjXqwL/7buk4DBOuLUDIXdR/TvtUBgm5cJ0aNC3V4pPhRsWraImRKFBY7/A+qoPet
         VH5eAdHQjAi/H0s00LOlJ5581EHrtV/F66uBfaRCVv1FuwnVCpWqwUIh0rt5F2IB65Ea
         kQ3bhZfbUrMbmnpJ7BKwxJegIJQ4+aTydZS21KZ9+we/ThSo5Xh+CCV0ojIfIRrTbJZ6
         v3HQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3tvpDYao0k67FgHgprCZibnnr8ZPZu65TSq5Kn0rT/AXjNtun4Ygt5EtME9far1DfBRRYMuI2NQg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7C727c9g0R97pkObMlJk8afATpkmbMHqYRK2H/JiA5TdwYakH
	LrzsH7YOCs3xXrrdqKuZ8HdCWlzzgsi9a7TrRt6C16BhFeLF0W7SFUDUkeTrq/uturSQChbiH9Y
	Iz47t1ne8BkiLw7yspePswtTDMgM3QDuWDOnQ67ZqZXc+wBoJhMQdz5FAywPxnw==
X-Gm-Gg: AZuq6aJbjV5dPjbM2e6WZw2mvEeBzNXa7Lj/a3Pq89Ouvh5BsfBMYOK4dSw+OrBihu/
	4m7veUyKMW1mE4qAqMNeKsnkbhlquAbkFO+Tts3RX0LwzOerXtoc6YkwXJ5eRhhTnCcroTofRjC
	w2cJhik368GDyRf305mJbcc/Z3zraniDyiaHQJ/pt5ntL6V7K7SsKwa93I5W0+AtDNgoL8vbkP5
	tiuedfJv1zqNknWB6jfg1I1UcE2EcquVK5CCMG72OsPEnshfHuEZ1APqAklDQ+nXm0tgHo36H2g
	pea3tHOX5+Dkl1PQdifrReF9+UgWYkTeiFCEZg2deRmvE61TB07NELdTT1oA94VjE1LO
X-Received: by 2002:a05:622a:580d:b0:4f4:c0d0:2014 with SMTP id d75a77b69052e-502f7e15826mr12460861cf.15.1769125024185;
        Thu, 22 Jan 2026 15:37:04 -0800 (PST)
X-Received: by 2002:a05:622a:580d:b0:4f4:c0d0:2014 with SMTP id d75a77b69052e-502f7e15826mr12460651cf.15.1769125023891;
        Thu, 22 Jan 2026 15:37:03 -0800 (PST)
Received: from redhat.com ([2603:301f:1601:7a00::a701])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502fb8e74ebsm549251cf.0.2026.01.22.15.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 15:37:02 -0800 (PST)
Date: Thu, 22 Jan 2026 18:37:00 -0500
From: Brian Masney <bmasney@redhat.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] clk: st: clkgen-pll: Rename clk variable in
 clkgen_c32_pll_setup()
Message-ID: <aXK0nJojFrDMWVm3@redhat.com>
References: <20260121012223.186199-1-lihaoxiang@isrc.iscas.ac.cn>
 <20260121012223.186199-4-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121012223.186199-4-lihaoxiang@isrc.iscas.ac.cn>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Wed, Jan 21, 2026 at 09:22:19AM +0800, Haoxiang Li wrote:
> In clkgen_c32_pll_setup(), `clk` is used for two distint variables' name.
> This patch rename the later `clk` to `odf_clk`.
> The rename is in preparation for cleaning up some memory leaks.
> 
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>

