Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2666E31DD97
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 19:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784919976; cv=none; b=YmWsLxKHsxXuCQfdY6YwJUMHVDzeYpk9yw87vk/9evgyNCRQYGafPUWqfMwIvatR2tNgaoxlFmnE5dWwwmG+0Q0crSUCm2jxL5fv/5p+RPHSqyUjmggMJqNMB0YCfWPU9khZxngV3cVuHgoQc8w+G6aKcT7NaetUGBVZt0ec3JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784919976; c=relaxed/simple;
	bh=O2iyMgC+AvzLJjevlmOcN4mbL02965SyrDBtMI+zJT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JY1rHCJigRAlL4ANa199qLroB1PCAvRouV5eAmENSc4YDs/yz3lld+iA26Lsa9bHXpvScpAcVhRZekRiXnUMQ1NO5F7IcPKJEtzBJ01SQp1T3jZU4SXt+gkLA6Z9TZR0964GvMrAvmbW58KuUCL+u89qxPQ7f9Tsc/NiyTz83Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OOAu+tzT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gk5+3b3L; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OOAu+tzT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gk5+3b3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784919973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bSqKtq9R3JDxVUXd7m+hWxueSWIWc3a+tAAVUY+kWL4=;
	b=OOAu+tzTdr7HUS1Ddk5dav6wmz+Seqe7m7iza5PGudIHACCpfXic3d7dau0jKosXmfP5Zv
	pXg/JkKe3xWDVNPS7uQaK1n6oKmOwDWZSwdCgEN9plEjKWTDFjN8Tgb7zpw+EYjkdXskZe
	SQSO9YXBzLze2mA3mwN9AtHlN8hu1+A=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-P1N2JY4_OOuiNMuy-5J9IA-1; Fri, 24 Jul 2026 15:06:11 -0400
X-MC-Unique: P1N2JY4_OOuiNMuy-5J9IA-1
X-Mimecast-MFC-AGG-ID: P1N2JY4_OOuiNMuy-5J9IA_1784919971
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e66f9e2baso111795085a.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 12:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784919971; x=1785524771; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bSqKtq9R3JDxVUXd7m+hWxueSWIWc3a+tAAVUY+kWL4=;
        b=Gk5+3b3LULGZPv0/iXmhYcYFMRVMBKk7x7k+lFSwL2UUCxkGhfxAxkjtUA7M9pxk0a
         JfoEu7zKcWgTjVnMjY3744cLnxC8Eai7uMtHhi+2ULLfY61idvrMKmOiOHM5W4mccDNx
         F2xg3R4ib9GixttOrPNOW/9XGbMUe3fdaW/DzSD1zB9T1Cg4abo6U80DdY1/PCk0Pe+I
         pwVmO83/m4pUXgg7gGlcfJlROHaG1G3b8PgkfhPyjtHSMrs+7fatvHY8VglVDQP0iQc3
         WrcmIIKnhWcaLr/JV7ZG8OhZA9RuX+9K3vmnUd5KCojZ/TZESDaaDx7NA1TLCKbzQfNL
         7G8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784919971; x=1785524771;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bSqKtq9R3JDxVUXd7m+hWxueSWIWc3a+tAAVUY+kWL4=;
        b=amEmK9SPUVTwK9JFSfvmHhOZZybreFRCp5gGBpxkZpHekeJIAE8mvy6ejBpUVRFsqz
         FLy4tplcUq1BraHMDVkuwwI07rVQO3Bug9PigiVKUuP/RrHK8RzrpHDeIA4C27PUARDJ
         jQ9el38LPbF8cKR+k0Qt/WrQjd6fdcr5Uofeglkw11VuEHNJU8GZN4ZhxNBj0a6P6KvO
         3ZG+7R/Mh62LS8vh62NFVak6ZiUyhr7Oh0hMlPTgn0+yt81+AM9X/v9y/kWbk3Lkhb3r
         9upFscIguWI/qWt4P9WW4MojT5ayOAqCaamMKQN5OSTewBaLeYC82yMu4cm58gAUcVVZ
         B36A==
X-Forwarded-Encrypted: i=1; AHgh+RrlLh7pd1BZn12E1DQtArCjJb5xDN2mtFk/2k7zgY4ubFW1qUMenIqxTnyDFsfn83FhyBfZpX6rwFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzuhOuFoGfTw+kPUZfbzjPVnAoMkplkoi8LPtmWDbnJ8ZK0kJS
	EUcrYkaKZyh7NdtmbSALn5PBMeWunAH8TQcXU0k/7jOJzMwRzUluucr9b0kCAuEwqFbU5zTUNCz
	Q6VnjiGKFnHBDlYPSCXZzTDJgeqofw6XnZlCqiqeDLIZ5hFaAD6z9bZLOGWF5KA==
X-Gm-Gg: AR+sD10ORwF2SsudlKialwm5qnWxU5j8kZTnjaeHaDL3y/j/iANyRu4m29ZO5Q89u7x
	VIgnTtFu566mXPk68vyd2sWkqQl7jLHXKX0soAm2tyaNRwxUlEKlO5sa8TY8GQLoQaZ3Zp+rZjC
	+5PoEGFPBSic+z+8E/4H+wqrgn5lYsNjL5jU7ODWH6pXo4drjskyknPxZxc2gbnLGmQlFBHKtDt
	IOQTNFrSOmyEScV2m1p+XQS9SUqy2ZCg1szws6NsgL7o3Aj3u8/PBSFraFAnbZrbqQU3VCvgVFG
	1q7B3S5M8xwC42RZDs6dkWC2JpDCUYc1FrMOHAcJmi3i4FCq2LUbqYs1tZJoh+O35bMYObS1OYo
	wSEDck1MoD7gSFKeU+AM0Ogpwnrs4PzGoiR8=
X-Received: by 2002:a05:620a:4706:b0:92b:6805:9197 with SMTP id af79cd13be357-93103910d40mr1008951485a.63.1784919971301;
        Fri, 24 Jul 2026 12:06:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4706:b0:92b:6805:9197 with SMTP id af79cd13be357-93103910d40mr1008946585a.63.1784919970832;
        Fri, 24 Jul 2026 12:06:10 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a88b88sm710983185a.42.2026.07.24.12.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:06:10 -0700 (PDT)
Date: Fri, 24 Jul 2026 15:06:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: en7523: add support for dedicated PCIe PERSTOUT
 reset
Message-ID: <amO3oF6B6aHVfL9K@redhat.com>
References: <20260723190133.22577-1-ansuelsmth@gmail.com>
 <20260723190133.22577-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723190133.22577-2-ansuelsmth@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Thu, Jul 23, 2026 at 09:01:31PM +0200, Christian Marangi wrote:
> Add support for resetting the PCIe lines with the PERSTOUT reset. These
> special reset are controlled by the PCIC register and are specific to each
> of the 3 PCIe lines.
> 
> Contrary to the dedicated reset register where 0 deassert and 1 assert the
> reset line for the related bit, for PCIe PERSTOUT reset in the PCIC
> register, the deassert and assert value is swapped, with 1 for deassert and
> 0 for assert. (HW have these bit set as 1 by default after a cold boot)
> This is internally handled in the reset function.
> 
> PCI enable/disable are updated to drop PERSTOUT bits in favor dedicated
> reset handling.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

