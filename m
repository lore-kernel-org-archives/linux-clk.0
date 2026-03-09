Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F7D3D4111
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068999; cv=none; b=JlRREDwKZ9pi8naODigIrb07PKA1KwTVVqKjSHKk6AtXTq4baKFzPxEH9aQBbnEfuLT9QQpo6+M3VzvH8/yE9XtqNMG6h0gLvrL3/G/qQuAtI6L2rncR/s5okrQCK2fjo6zExlcygqt6fEwW+9dX+HYsRTOmMSTzA+EtPPAqG6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068999; c=relaxed/simple;
	bh=viVfYZ8OKZXVEa/iVdY4DgeANWbwKgm6k61jxlrmoK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aeiNKlAYywZla4qeVzEHsFYrNP78DG7pruEKVLOtn5AtWOp3RCtEiXXIiQhYDF0tFAkBI9jTpFcYBo5D5Chi9mw6m4spDHAO9OnU0VSvwBOHLGZbjLEcPv+FQ/slE1j+QWZVPODsRecb8Ksa99LaPyU0DdaxscKPD6Qt/rgLcTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b4L3zOto; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aE1NTwsf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b4L3zOto";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aE1NTwsf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773068996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ugkBZJbjXTewXquJACdQmpk7FShKGPugDg36WCZMqGU=;
	b=b4L3zOto5hjwEn8+Pf7Z4BDgt4YZ5hZZLl9KXPUUinKAdWnv7l8ctR9i1gznFheSsfx2J8
	oSN2P3V82pD8BV3eGx1H4k3iMmt1UYm4qdLav6MMSzLT1bxQIGWp4S3kCLBghjElla/cSq
	qj96K6z/bZDEvV9VtfqR48wa0yiTVHg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-sWmiqsIENbi9Vf1iJczKTQ-1; Mon, 09 Mar 2026 11:09:54 -0400
X-MC-Unique: sWmiqsIENbi9Vf1iJczKTQ-1
X-Mimecast-MFC-AGG-ID: sWmiqsIENbi9Vf1iJczKTQ_1773068994
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509114d7418so4955321cf.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 08:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773068994; x=1773673794; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugkBZJbjXTewXquJACdQmpk7FShKGPugDg36WCZMqGU=;
        b=aE1NTwsfHld5fhtGCAN9iQKYbAbBpfY1oIm17vw3lVXynCygwiP0Z4QOWpIPlJ6Jr7
         gwrRtxF8BJTm52BKRYstbWk9aHy2y7yhw95LLYdRvqdzW4KxYW09TtFGkvP/lZPNIByZ
         b07feaoMBiYh5wub3QhrQ5yc1h34xQxcqK5R9bFVRzJUL6cEBQELvNTyy6jmzADQWXOO
         5s+pG3DQXyGIRcBz9RdAsxanSYBjn6INYNOScNvkMNoIWrHAHsKQwaXU0H2I54umca5E
         /w5R1AjOZGM6yaq/ZLbVBY7HbNly9xXzA6argnEx0o1Aj5Urdj9HsawyxPt1qQ3y//rj
         OwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068994; x=1773673794;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ugkBZJbjXTewXquJACdQmpk7FShKGPugDg36WCZMqGU=;
        b=UmeeMFXieBMob9reJ2DhxgRu3A8QJ+dzTM2bvdDa3WlXp0apKGLNTotM+p4YG05chf
         oRnZ6SLS/hyhqWCQNDvCVJcq/tMIL7MuwucLL3scL6qvcwy5qsdRCnzLM80VVJhLMPA0
         7xlQN4HIi4icY95pnonnDhAd0RwfBoDI9E9Mmru4o0SBOPGrro1Go6dhLcK6F9iZRzlI
         iYJiJEA1Wmsxz2/JkpFv21ydDImd6NaBzfW786e2pg3LC2YAXMP0/Ck9Uq47KVXRsnmz
         CmH6NFkA/8nQ289yN5HW5V0iMCv4FJFW/MHn3n9z2QkO0gxjp8COp5h/2DQFno8NqOjw
         4hYg==
X-Forwarded-Encrypted: i=1; AJvYcCVnfnQHiXsLJP8yeXr8XyQwaeLpXQxyfi27xqVBmsCOWW3s4eG6bRjArf6AptOnWoe0I5RmiwYe0Qo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAIIU5BUv9usEcU9L0EiL4Cvo/UeD1QKoULAIe4Q1t/QbmeMZl
	9tPd26KeRqjbzqpzGZby0W+UCrNlcjEFkjAGRg0E7HOlvAL8RFezhiY8Biz+//yOpT8xLY+2m0x
	L+9Fp0L8g3m9ufTfLB1Wxq0U5B4lRJsSQYyT8AZK/7LHQ/H3oIaKB31G4FUAsww==
X-Gm-Gg: ATEYQzz6/lKAxZwzHiO3LsJlkiAPaUhjGNstVUqo4S4I5BxD6g5hpH4E1Nl3Okzhq+3
	3YTM4rN8wQv3XoWPLo/ARVdg0/SwkyDmIAo2jSJyeqVu8ee9hUWVBMBfJdLaYcx2JAwqEy4rTl7
	E7Diq4Ux1VR6exJGLbnDa5iXwGytci+zZN6cTD2Hq1iGBYOGDlM6cl2vXFm2JiI54fm9dZ0wRyt
	k+jRAH0jgxSXa5XJKdmppzqmkOrlx2rAi9u0U6k7Xodf+jTasHw9apJIuosEQhLHvaRNsnB0Zfe
	O1SlmQtT7VIBEDve4AUjQvF9kJnUJEqJTJAIj24/yxi8NbmgvlN2JV7QZiGap+oSeantwlFzKH5
	SeLEpkjXlT695s2KalP01Yjud1KOaCV/nCtn1iftZf7Q5UzjHxkRPm/Yf
X-Received: by 2002:ac8:5ad3:0:b0:509:116c:8e05 with SMTP id d75a77b69052e-509116c97fbmr76653981cf.43.1773068994222;
        Mon, 09 Mar 2026 08:09:54 -0700 (PDT)
X-Received: by 2002:ac8:5ad3:0:b0:509:116c:8e05 with SMTP id d75a77b69052e-509116c97fbmr76653381cf.43.1773068993814;
        Mon, 09 Mar 2026 08:09:53 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50907d98162sm44069531cf.25.2026.03.09.08.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:09:53 -0700 (PDT)
Date: Mon, 9 Mar 2026 11:09:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: xgene: Fix mapping leak in xgene_pllclk_init()
Message-ID: <aa7ivya4dWXStPPV@redhat.com>
References: <0d175826e203f2c2fa7060d57763286ec3fe2f43.1772705227.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d175826e203f2c2fa7060d57763286ec3fe2f43.1772705227.git.geert+renesas@glider.be>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Mar 05, 2026 at 11:11:16AM +0100, Geert Uytterhoeven wrote:
> If xgene_register_clk_pll() fails, the mapped register block is never
> unmapped.
> 
> Fixes: 308964caeebc45eb ("clk: Add APM X-Gene SoC clock driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

