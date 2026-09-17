Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A044E73DC
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 15:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657693; cv=none; b=c6nurdIr17lvv4fb2Fbb96nwiknqfCOWOP0XDykEWTcgcFFWLU0RhvRLt73UoM3bdZYO/I5UPvob3AOHuAqrY4kVfwKsDLj1LW+kewyAGftNgUmsvewmwINyj9rtYd2BM4Q+sVT/y17ZS9Ay57oTZRDcowHzMG65X9m44Wxn0MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657693; c=relaxed/simple;
	bh=puhBDsPAB2d2yNXgFPi6/Kxk4MWUwb8s4nQjU9ngqWc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A0j56fKDL5+y3RE7io/S+vi9H/snIFCVJqIksqu3TfMSY8g1FYSURRshJKfv/80y3DOGnEO+Q8LilXTdkSWX302cwcdr4QVixe7mN9nyNW+wjpzysoKnCSuVykrJepB1+MuAIxXymwMCaDge8SjyLIPJnICjUxbj+9EqS2mdmYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qr836y6D; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZDMghF/6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qr836y6D";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZDMghF/6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789657671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aJWfRz/qUQ+jC0/O5zIduIK06j1/9KJXZaDkdj0AX0s=;
	b=Qr836y6DqCgPTLwcvVp8taBKQUSdhYJMI9sBOpAG1fpPH3L/ImGcf+WbYcuPsbgCsAuAGV
	HBUQ1xvikVSB9/3FEUEOFntlX65PlAl7qgT8OdUsXdvhSE269ZUu76xwVIac8lsx+ZCXtx
	K6BqmmrtPGrKWCvQzzMAVLng+597AIA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-OTfpYybnP0qb8IXFmXoXdg-1; Thu, 17 Sep 2026 11:07:50 -0400
X-MC-Unique: OTfpYybnP0qb8IXFmXoXdg-1
X-Mimecast-MFC-AGG-ID: OTfpYybnP0qb8IXFmXoXdg_1789657670
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91245cf2b35so14876066d6.2
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 08:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789657670; x=1790262470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJWfRz/qUQ+jC0/O5zIduIK06j1/9KJXZaDkdj0AX0s=;
        b=ZDMghF/6yf9do5obm4RrS7FTY5BrcILvA5zxeuIapTM0AnvIaKPNwAhMCP0RP/7zN2
         X/AwwIxtgj34aUZwJxjw/pTLCx1n8XfY1rh6fgQ+J7pRF2cyKXnrN59+D647ZlgQlcGJ
         7uHuFEVGbIBrLG0hUCU22bgwJKX9L78NWUIxJERov6ArTKD8DGmRUP4Javq2iBIGEtUY
         Px+hVPOuENotVFhVkBsug5IbsPF5eZEANhsd1PtSVgTO+7NbWrRQa1UzRvb/KWN8kSxJ
         QHXqbnd9P1fuqxYX1GiR1voOBzuYM7/RG7AgVu035weyARuiPRxJXb/RoEmp7dSfidTE
         xPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657670; x=1790262470;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJWfRz/qUQ+jC0/O5zIduIK06j1/9KJXZaDkdj0AX0s=;
        b=ykuxRCV5V9+nA2zHjzPg6jtKkhgml+fsWwWaCubp9qA3nc9aUZ4mErXQWazyVcPsvL
         RljgLw4A1FVf0uDhJxqWgxCPJS/3mKt70h7wm3AM8s0L4YktnsNaZ2+fFfyxRYcv7ne+
         WyjcLHyi/+iDGHtEN4lKAbGC06a2ggvf2kJL8eiCdtYG09gB64FGkZSEbiHtTeibKCug
         7KHAgqMjixrZWCB7WvE3T6kfpvleeMOhNwDJOjk9PRXYHwhululCnHspifjkpInfJ8RT
         xLyHkImzHu6nmJa4RZ8pJFHuCLDuIYa6AhfAg1ElDXswSTlC2blRaVpWd48n0OQboI5P
         OZHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDFJtQvP2y1x+l4jAMYj8w+OF4Tqpedl1FLrNVaKCNf3ztoJm8H0f7ta/bllj3rmBFeg8oJjLYU+s=@vger.kernel.org
X-Gm-Message-State: AFuF++kAgl4VPtlJ0UzyO8vtkXPqOMGhA2OsAB9Dstv8M7B6Vl3Q9YOT
	vlTNFEcJWRqikuHmP8pqfEvnnM3XjOaFxtyFk9Km58rs8wd48nFgBSPV0Pkbk7xO6ENsa3XDeOX
	vO++2pEssTOZaIj/tukU0dPTxcCNp7K9vDsjIG01qpSBFVsN+hH7QQB4oUZXgqFMB6nD0j5239J
	FJDTNMwOj80m6pC2NwAj+uv8l/twM6+mu5xhwAHmMwEwKz
X-Gm-Gg: AYBFou22wKKSWqbtM84VCE5u9KUPU8aPvJZLgfpfytyMrSroPzbCAiSvBQMo0jseU/R
	Xm065WxzIHK4NKNWcTOWpcJHAoxhKjcxcJYb78QTjkNIflnua60se+TqFJddNgYzyUqsUx/xatE
	Hjl4IR9fwMuEVK94u6S89y2d8jRJQ7Jg8CZl94Qtc7KBPs5QQCjF87tBRM60oHLzjT1uh5EUq1v
	nYJMljZhwhdywqlCr+MyImDFojeodwvZYjICFuQJbqcecVID2G1Yeey1HNlRWNaxmgdMFz0W/AA
	tOgvBXmIvdQfGz0rrvGPhG3ZQLt1gR3if2KVkWNmPglQ8aCn/P9kr6f/R1Ddb/Ft0pbQOVFUQVo
	PpcamftJX64oJ7bIUwGE6qR6vdnspnb6x9lU9620=
X-Received: by 2002:a05:6214:2528:b0:912:3cfe:2dcf with SMTP id 6a1803df08f44-9123d722381mr122578776d6.4.1789657669564;
        Thu, 17 Sep 2026 08:07:49 -0700 (PDT)
X-Received: by 2002:a05:6214:2528:b0:912:3cfe:2dcf with SMTP id 6a1803df08f44-9123d722381mr122577906d6.4.1789657669090;
        Thu, 17 Sep 2026 08:07:49 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123beb4884sm53020536d6.37.2026.09.17.08.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:07:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Pengpeng Hou <hppiscas@163.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260906033924.84982-1-hppiscas@163.com>
References: <20260906033924.84982-1-hppiscas@163.com>
Subject: Re: [PATCH] clk: milbeaut: Return divider update timeouts
Message-Id: <178965765056.360090.17314142622981965069.b4-ty@b4>
Date: Thu, 17 Sep 2026 11:07:30 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=294; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Zw0k9Wy8piJ6fXZzS55E7Sk9e3u/FCgs7eWCZAOw1LM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLWMFkzxxy8tU/vtPXT5zMC10rp8Xi55LyM3ls241nW1
 47Vx17e7ShlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiW14y/A8s+zJz+29Hoe75
 rBftzdJOZLttuj1l+Zq+Jwrfw3QNUm4wMrQELLB+OmHS3l3LC2e3H7riUzHl6faCFwLHe66fC7S
 av5cJAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 06 Sep 2026 11:39:24 +0800, Pengpeng Hou wrote:
> clk: milbeaut: Return divider update timeouts

Applied, thanks!

[1/1] clk: milbeaut: Return divider update timeouts
      commit: 526066a4bd5658962800fa64bd3e5432e1f7f92b

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

