Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2032E54A0
	for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 20:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761596814; cv=none; b=ZHX018Gc5UdzK+Tzy0SbpXPnmnHv774ahTa8ZrRdHRzIssAt/RAsplwiNct6tW1V+MfKWU4hU++8aSpmV/s2lzLLyZfVRB+d/X8/V313ETdASGqfKMNTZrBh36h/KicVbrxPIC03YYdFxZvLrM6WDhxiGZS331hmAWTLuQ2R7mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761596814; c=relaxed/simple;
	bh=7yChQB4/5T+chrdHyP+j5cj+seqbPo3q/T88JzHOM2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpyajzDPuUxbZgnjksQ5BZ888zfe6q30xgk21/BLvSnO79zCG9N0yc8jGKdthbnj78EuI6Lm3VTSO9NZhUqc7QekROreagw1gLJpnEm7SWC8JVPy/hI0pPHXmgVHQo21Dqhu+vgrTMDcgwsz6Y5dwUAKbKTVKVF8Hy3SHlLlC4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EMGLz+AY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EMGLz+AY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761596811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/SBV90iCKGz6XON109DoFy6Jo9KP1hBDt8Ha5ZIeUs=;
	b=EMGLz+AYS+vgGUZJV8T7VtbGoQAzCaM7VokDn9t/naHm20XWuztcxBHmo7QW5geNydedPJ
	xtirCq1wnTloYTsEHk7y45SXDG5NX9vlaU1XijapsYeO9BOKUrlBrECfTVG7F44/oWqerQ
	5kbzHn5lQXsBqqZVJO9O4sY3D1mvdM8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-OnP7kbazM3Ou1EMmey8FvA-1; Mon, 27 Oct 2025 16:26:50 -0400
X-MC-Unique: OnP7kbazM3Ou1EMmey8FvA-1
X-Mimecast-MFC-AGG-ID: OnP7kbazM3Ou1EMmey8FvA_1761596809
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8a5b03118f4so224014585a.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 13:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761596809; x=1762201609;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/SBV90iCKGz6XON109DoFy6Jo9KP1hBDt8Ha5ZIeUs=;
        b=c+pcfJM8HZLWiiyZoMH0stAhNQ5BSLjMG1/aNr6NBRq2+vrbVhqkzPIF1sp7wqp5Nf
         tLosJOhAurDEb4eCmQ/4OYdJUIOXHvEdODBnaTJPmJYZXYijMqeQwxoRmbw9uIl5EgG8
         D/TwGqpxVguBUgwC1bGolDrHcqaEP+osq91U2CQldF9rziF24tkMgliEMhjgP3QWJl+A
         z/RHqsKK0/8xCEaKyP5eC0+nRg7+vslvjTYQ1d+laPPywGrOWllarsA//qMRcswUxDkd
         5zM5+AIsapPqeWzyYZO1TKZL7K/lg1vE/MBSFtfzpDwnScbguqSkKsjukZ35DuJnaT0g
         2S3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNinNWyVxRHekRkrTZnCIFzj8DS1WWIZbT/ETYJ/x1Ise79PDyR5WDcQ20aotN1d5NtCea3CWx6/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXSRxsA7jwFlZ1GmAdw5PTLXgipc5DQwZ8WAk4vZ91K0XSlTAV
	eLlxiDFiZE1SGArUF9g9WFZ4eDq8Svc5oUiIMQgIMl4UcTeD7Svyqeqq6vKbIo9GBRdIAq9eT/I
	+UTMx/0x6RL26YPrXqfyjbwuXE6B/jYA2JPKjx4JBWMN+QK5i8DcG+f/v5Q/4vcjXvYXm5g==
X-Gm-Gg: ASbGncvy3decuN0hTnFrPxJeus8IE9MGgaoWsBktDJftlCb/fuaL95gxG92NavYHOV7
	LWbxUVD1R+RD9YBm2WitBShGVzsRfKaHxmoxrPahjxKSW1R+Nj2o50S9gY1JF2ZaHuz1xufQ9dv
	uk1Av9GgvdeyGiKCZTMd6WNUxCMZ804A8wGbt/DMpUOQ4olBwNRqMYmOVSZpOsk/8NAZj+1WLAF
	xx8v2ImOm5QrP7DIIXp5RXfATKV02GXYOGPpeKmII2qXU6G3g2wj7pDql27FGlKpg+8VVjhVLGJ
	8t6xMAJpn4NidRmUoxr+o8q68aKDUsYyW7dH6Mau2g+j6u7HQ1Ae58W9enDJjcSEoJlXqsH+ax6
	yVclJ6f/5X0g2qpejF+eE3Ltcm3KeLKkejQRq8Zt5X3aBEOHLLJrXo8w7Mb3pjhxVMQ==
X-Received: by 2002:a05:620a:2544:b0:88e:6bac:92e7 with SMTP id af79cd13be357-8a7283cf657mr93233185a.44.1761596809052;
        Mon, 27 Oct 2025 13:26:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUEmCLFiys53M27OcwnIWGH/VtfZVuFONe30VKZoy1ylmoq5yRl+2RmIUCn1F3cGE5/JrVxw==
X-Received: by 2002:a05:620a:2544:b0:88e:6bac:92e7 with SMTP id af79cd13be357-8a7283cf657mr93230885a.44.1761596808648;
        Mon, 27 Oct 2025 13:26:48 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f24cd5617sm667155385a.19.2025.10.27.13.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 13:26:48 -0700 (PDT)
Date: Mon, 27 Oct 2025 16:26:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: tests: Add tests for clk lookup by name
Message-ID: <aP_VhHGLj3-JvgTB@redhat.com>
References: <20251015090701.2049164-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015090701.2049164-1-wenst@chromium.org>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Wed, Oct 15, 2025 at 05:06:59PM +0800, Chen-Yu Tsai wrote:
> Clk lookup (by name) recently gained some performance improvements at
> the expense of more complexity within the lookup code.
> 
> To make sure that this works as intended and doesn't break, add some
> basic tests for this part of the CCF.
> 
> A new "clk_hw_lookup()" function is added purely for running kunit
> tests.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>

