Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4505A2E11C7
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 18:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772042632; cv=none; b=lpc3N5r0N1lPmT/BorhmIPg37w3p2zC1DHb/bot0xvOY9DwuSRTtRWTnsZSt+NrqWsH5D+G/ts9ZKRo2j4yIOrreHO3bXA7KN7hM0AfNfQzr0Wxui4HvtvsYyN6a4vKj/vAiCnBBzL4N84JMUOzMo3OpjuBpFbkm6rsCctfYajc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772042632; c=relaxed/simple;
	bh=MmARsqarVWYjm+54SaUsHFm4rZoU59aSNLfvdQvFOuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=seYaw9ITxMxmnJ1SZsvOEa0lkvIcUnXO1ndTJg3wYn/1s5OL23XjhrfP4oMRjqsbWZbrumuw0hqwfIKxy+5fP7gSKL3ifShIDdpOp/AMvGOJQgRQPFQeXeSZhcQwRsznfCt97uUSSuQbXAiq3VyBMfp3H/ybP+mwzIGwvPFBFAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qr+YaP5Z; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=l12N0e/i; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qr+YaP5Z";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="l12N0e/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772042630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kwGXx7/xeR2LBvvfDJt+t3F/Oj7s7dUqIa7j319rUsI=;
	b=Qr+YaP5Z/gGo5F3mAoAlNtHPJRBZKfzItR4E3JeRJQCkSybh09e7iTbgXykxolYonJJUeD
	3U+8xXw4ZbtZoqJ+6kd4Vtm3HmCor75HpsjeWkhHR7bNd6qIkUsJvcDaHlf+IIw2cH2v3g
	S2ONVyE4zaawluzMe66i5E7NcvJVpzc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-PAaP06B5ObK_h4KFZCVapQ-1; Wed, 25 Feb 2026 13:03:43 -0500
X-MC-Unique: PAaP06B5ObK_h4KFZCVapQ-1
X-Mimecast-MFC-AGG-ID: PAaP06B5ObK_h4KFZCVapQ_1772042622
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506c0231e63so73779451cf.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 10:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772042622; x=1772647422; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwGXx7/xeR2LBvvfDJt+t3F/Oj7s7dUqIa7j319rUsI=;
        b=l12N0e/ijHls5FpXqJ9eiAm+QIq8cCGM7/qmxDSUxt0XZ/GShOJG78sRQDQqUl14Nv
         rlPyqNuPm8hcqGqEbr2OTd+RWSr4hLJh6xlwkufXcRlHIB0lxRbDTjkzn2IUKwPFMZEN
         urjq6YvyY1Yy49m63vl5dmhOJYi1rDvz+cr99dKEwBAsHJy4WbzIAsNRZEcfUcuJy272
         Q7NtNfUDQqwfjSJ/0170qWKjdrpyYAiLdDmD5RnfIdt7JlrhwRX+yo04vZtzY2VkkoMC
         JbPgTmQ7f/TPvvgl1cwxyCnINrj8fPh+Y770ozvtb3PahNMhMSoqZuCsaPsHsDGGK2yr
         SwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772042622; x=1772647422;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kwGXx7/xeR2LBvvfDJt+t3F/Oj7s7dUqIa7j319rUsI=;
        b=jmB/ChqqQXdczpBB0WxYZevPVqzTUbL6nPP38tibbnLDUoLSWVnE471F/INMsdAHSg
         hoi0hSpRfufFChqLjBY+6MQal5vIOxEdA36bVE0foDOdyg8xDrT8/Si0nfX0VN1j/WmL
         Ml+8nSzLvGoQPFzTw3sBWKEpteucAFicYVkMuOnLqyrr5CZGuN/Jx1Xt8mY9agpNVc0F
         ski+EVOUemHBA/cUb473TjUuT2p2BYNVun/fQibRL+rMuaTMShE1Qh+w+1aZk4hYpcmc
         c7hHViFC8fFiuKQQDz9p1mms/PybkENPPNdWYjFIiVnzQYxwjXI8nwqx94bfdKFcKZTd
         3RnA==
X-Gm-Message-State: AOJu0YxtCVXAqnSOLmlRAU/nmleJKya5bezeGZPb3haOhz+fehYe3luZ
	ebv1RFjq/y1vS1s5QCLW8fKGxr6NBg02PZ6tupTL5IG6KclMUi9oP2+aXFw5FqF533OyEspii8I
	KnFhWZKNLe7z4IGY6ZpAb58uuyZCRBRildHuGHPOakYCm9Ix9/ViTZUw3b0EZUQ==
X-Gm-Gg: ATEYQzyvJou+RE5PACLhyVQGqd0cftdDkdsrIm/+XuqcKGPEvSxD/avnSbNxcfBd0bM
	NJdxqQeo1TFakyxPZ0FWzxaLpO6GSahJCB4b5bBRjKqQid75bT9C2ViVAH6vUhmiJiDEsb0q9y+
	7L5E1rtg6gVS48cnOrwp7mySGL4w0oFwlNepkGSzU+xnrvAGP4xFalUHfx9CsOs4uXzkrSOhbmi
	o5f6KOaGajXlmptuV/WA/2o3XnEUZlMgesy1R49ulsS+I1cJm82Oe109vXUFUiCvwCilqtLJ893
	5II75IvW1gkRjstu6PFJXD0ylmRdaOu74P6rvkPKbhTNzDSZ3tbQk29J6BrZGY8z0LuiHH5tPnD
	dw+ahbDzhJAE9dKdR1T0+
X-Received: by 2002:ac8:7dd1:0:b0:506:a75b:2603 with SMTP id d75a77b69052e-5073662bdc2mr62938711cf.34.1772042622534;
        Wed, 25 Feb 2026 10:03:42 -0800 (PST)
X-Received: by 2002:ac8:7dd1:0:b0:506:a75b:2603 with SMTP id d75a77b69052e-5073662bdc2mr62938131cf.34.1772042622005;
        Wed, 25 Feb 2026 10:03:42 -0800 (PST)
Received: from redhat.com ([2600:382:8526:293f:5859:7f47:3a71:5e41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5070d6a1ddasm131690681cf.21.2026.02.25.10.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 10:03:41 -0800 (PST)
Date: Wed, 25 Feb 2026 13:03:38 -0500
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org, Waldemar Brodkorb <wbx@openadk.org>
Subject: Re: [PATCH] clk: microchip: rename clk-core to clk-pic32
Message-ID: <aZ85eiW-bQNHPCaW@redhat.com>
References: <20260225-puzzle-cargo-9d23eedf7957@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225-puzzle-cargo-9d23eedf7957@spud>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Wed, Feb 25, 2026 at 05:44:52PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> clk-core is a confusingly generic name, since it is only used by a
> single platform and it uses very similar naming to the "soft" IP cores
> for use in FPGA fabric (CoreClock or similar is what that would be
> called, although nothing like that exists right now) that the FPGA
> business unit produces. Rename it to clk-pic32, matching the prefix
> used by most functions in the driver. As far as I can tell, impact
> on whatever users may (or may not...) exist for the platform is minimal
> as it's built-in only and the functions are called directly from
> clk-pic32mzda.c
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

