Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AABDF6C
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429100; cv=none; b=s7fvNMg4B/BdZVbmrqyS57iKIhxKSoyl/77BV8HIJqjPKbv6tiZhRjIYjlL8WGeDWuaUmH7oJY5bcO7vCBP820zYHcK6JLXDs0YMuWKgEuEH/xAqceYLrOQuhzfan8nu/brg3FPrBAbennNYmUwlg3lp9e+wm4taPTZarOgdMJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429100; c=relaxed/simple;
	bh=4DEOhG/gAL2tFwgrO17fUGpYKuc98k4IngdS7c+uNb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7IgNu9+sEd7Gu/q3WOS2EN6MLtNqLiE5NxIDuycoIcMNaLjj2ge983YypYZLDNiVB29FgWMz4UGc0/oVV656whyyUWLGdoiV8rZOTLXdK2zcJ0Or/UuV0YdgfS97ijIuFupZPgy1zqlPACMuOVzlokkKNipn5ym3jMwWmyRNwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IlmkquUb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sm8fZ2JU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IlmkquUb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sm8fZ2JU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785429098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XjO18nbJbiIjdwy1Ooeo07xeKl9j1Vrh8YDkz9Zjps4=;
	b=IlmkquUb6Od1dUnK8+FhDu5Snsk5Yp+gWKs7yeafv8KOgyZjYUA5H1cB6PJ3FFuexEZgAQ
	Hz5H6SaJ13z8RttbT0MfyY3VLcmdC6Y6sMqQoD1oKvdAXRcbUkpvSSpNbiMkcPptIqa/nq
	HH4rZkJjAWW8hgsaVJkcj4UQ79DlLR4=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-UrV3g3RePRCUY6RbC9aSiQ-1; Thu, 30 Jul 2026 12:31:36 -0400
X-MC-Unique: UrV3g3RePRCUY6RbC9aSiQ-1
X-Mimecast-MFC-AGG-ID: UrV3g3RePRCUY6RbC9aSiQ_1785429096
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6688d64bf53so4542430d50.3
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 09:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785429096; x=1786033896; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XjO18nbJbiIjdwy1Ooeo07xeKl9j1Vrh8YDkz9Zjps4=;
        b=Sm8fZ2JUq5/0+nLOwRTZt1cwSorDk7k7eGR0aHfzMAXpPqk5v73i+mLB/O0bQjWbQb
         rgpstkGBIKPfQZRcbAOJpgh0DP8pXB8qw9l0gWJvik5C+0gAeLUeWGFBywa2uMAiMLVa
         A/4OvBCCDl6pqUCzFhIzzEEmOHVqjIqpYCxQ0U7z3iPpCT0eHhkshwpPeEN5nuecUMYO
         1Lr+iIQJ4STfTkb3PayxZnbSuixWCUK6t7HC/cz8tPG0VvyOS8qSBXZfphpffclZYQzh
         RGcGS7hul1Icwbl1qChqfG8bS9HiCkk40Oy/Gjj8C4clJsDlG7GceKHOEeG7S6623iOV
         wxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429096; x=1786033896;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XjO18nbJbiIjdwy1Ooeo07xeKl9j1Vrh8YDkz9Zjps4=;
        b=I+o9Wir4LtGvipluFmzM4/1XW6rO3goEaUQHWEc5WflJ9s9HXU8MaD+Xi8kbV4PWTa
         jcFb7OjvBspO1Hpf/tl0aY6I0Kp2yUoSwbMHKgWi2N2z/XZ9TF2h0QtPXoQd8eYagvtZ
         C20O5kycL7lov7ZJ5YDdmtuWTTrapyhkExZ98IMzjtPv61gORWjocAkzl8LI7MZrTQRV
         HDlsrI7nOmnZZklTDeBup7J8iW9/1eV6TbCKGwEmnFebV32gdJ3clWFZQDwKLz5WKmWA
         HCtftzhWqrqD3aH3N4eJp+BbNZ5T8zXuZ77W0Lbg9W9l/QblqYyD4wL0A943q3hT81Oc
         QVQw==
X-Forwarded-Encrypted: i=1; AHgh+RomyHydb1nJpvlL2fXP+Zvr8E2TTRycdMB3XDSyFE480+jxtsJGSW8KuIH7CvmnfLe8w1Ah887a9rs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN0aFoXsiRMj6gZwg2xn6Ax9WJLO0druinVG2+RJAu42tG0XWm
	BN0x9WB9kxAcmfoJ8Ul/u1Ovk/5znksTDlBb2pP5G00a5z0amWXRN8NU9vG0AWhAbH5jv8QW1T5
	OFguWyEbkz/XPPukS7+cI/5T3Llzt4bMQ3xW45yljMsxEdnRjtBfJoIX6ivzutQ==
X-Gm-Gg: AR+sD11q4g3jVsuT11iOKfhTKb6FR5l7aEPfwDm52AlDF9uneJEyLJ4Nm5WY5Hn9qgN
	XcUv5moTh7d5neuT3A6WOVvSXpwsSRPKP1I1jx8yg0FfB4FUXKfRmbp5VEwK5zVx8cDdoSgtiiN
	iLd1WcYz6+CCNGfYJ+0P3I2c22Uhr5UciSwvCeK2064oFw/EFIzENZMRcvRTMqnykz+lSuVot0n
	HmsNNuxgYK8SWcNnvdrLQ6NN2OKfcvCLA+ERXf9rVF17/PtYAvxlEi30kHNOVCrdowXGxChy63E
	oUFC1tPBlLlgUdpjSpqjHaAIQF5aN5HE3G/mH5F1pfcKuh1YLmTtQHWMSiFEej0dYGNUqNPTuwK
	GY5a3xuDBxkMhXATIakhZdG7Y5sQMnWkjO7A=
X-Received: by 2002:a05:690e:4809:b0:667:e8a3:ebd4 with SMTP id 956f58d0204a3-6693a328de2mr569809d50.4.1785429095906;
        Thu, 30 Jul 2026 09:31:35 -0700 (PDT)
X-Received: by 2002:a05:690e:4809:b0:667:e8a3:ebd4 with SMTP id 956f58d0204a3-6693a328de2mr569786d50.4.1785429095425;
        Thu, 30 Jul 2026 09:31:35 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6692c8e57f2sm1632516d50.13.2026.07.30.09.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:31:34 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:31:31 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v11 05/11] clk: realtek: Add support for phase locked
 loops (PLLs)
Message-ID: <amt8Y84Z0O3ZEVnk@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-6-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728142806.1954638-6-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Tue, Jul 28, 2026 at 10:28:00PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Provide a full set of PLL operations for programmable PLLs and a read-only
> variant for fixed or hardware-managed PLLs.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

