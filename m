Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438C314F112
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 19:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760643242; cv=none; b=m+c9bTdAIrAVdjdqbwccvaWfefjmgPD+1MrWKv1IbT5NDEwYa04E8PiZ3LWZZ4L6/2wOzKUTntC/2sitvRj2J6ymgame7+fSQOUqMXD/38eC5qdce/so+68mXO17ZG5fkkNvQ0n8ddg9yxC0t8XTGlDhK3YWvuY+41GYkd7CUls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760643242; c=relaxed/simple;
	bh=nJ6ctnrEA8Q56fp0ViPbOcho6E4CmzCEIQKhpkkDCLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJSorEAs97R6TFryoGn3onAYHwGos+aTahqXbBp964hSNU9pPFu4plKiBoXtc1DjQ4UQzMM1RTatxpPgOxidqhrif8bmnSMxST/oL/7yOZQFET6acHxN8YEuxLoPt+7vgvso3bmHKEawz+mCK8rhMFu0o5sxVGJI6ZSL3thgg6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Av9UdNx/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Av9UdNx/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760643240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uiHgWfmK+UdxQ6h4Om3AjYBL36s51e3Yfvg/vhnMSJc=;
	b=Av9UdNx/2Lp79zWbksZKG8Y/BobflFCWHiRh+NTbYDXBBza0CWluzF1nDXXcMsrulMJ1Ar
	dW6zWn5GUYbkBKeNmVW4wHy7tbzkiL2Sey3bbcQxGy/1iXL+7HVruh/QAniU+MeLL/K9Jp
	X0u6tjy9mqHJQCbvAOkeTclg2ueog7o=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-zohyr4v4NUCtZCALRCYzOg-1; Thu, 16 Oct 2025 15:33:59 -0400
X-MC-Unique: zohyr4v4NUCtZCALRCYzOg-1
X-Mimecast-MFC-AGG-ID: zohyr4v4NUCtZCALRCYzOg_1760643238
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-77f714293fdso16235817b3.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 12:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760643238; x=1761248038;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uiHgWfmK+UdxQ6h4Om3AjYBL36s51e3Yfvg/vhnMSJc=;
        b=QCxr5Q4ROSyAdRykY0khQbG0aa146UMXcesk1CYt+td3UzKPaOHdgqYXo0EGVObcBR
         t2ZkkR74oX1ZdoCAYHQH+7JLJEFRSTbamBhreZ7k0LfGM1RK/15kZbTGwf/X0yINnxZh
         rHpbJ9iyuFrzCJWAYKxHJb7+UBfgugNRr8ObS7alLQPDTgH7yFxUwyjfPmliUpjZkQZF
         JpfEW9QPj2AJNkEz43Q8kccrPsPwfQCEiFFAsdIxaLgUTaXhmknpEJ1dgq3iRZ4lORzD
         s9smDQUqTZVjuVgGLCmXNn2IiCagPJ4gYVns23Ang/ZPdjeDKHOy/ZmhERDvaF4fvLcD
         GSAA==
X-Forwarded-Encrypted: i=1; AJvYcCW5+1u/Chme8+iN047WMkg0+4a/DcEwx3MPoBPHwSnGii7/OKMjizfW6YGhIIXl8yP8JK4m2y4HZPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGI/DLwi9GD9Zk2h3v4Qj/cl5ezDkUiCS0IUmgcljVnSZcKBBR
	Ps6+wyOq2FL6XBBdoZLiZ+O/5bzF8/F/xeoOkiXSTugKmZZ0uQ5masZ1IFlGgPsVKRLmzKP7pKj
	hOSoElufWRJZlioBMBwJuUxXdIS6H68JQWTXRNPHPhoOp5KLj2PRHBn+WFSBJ+ncHxIE3XQ==
X-Gm-Gg: ASbGncuGqC63oniC1nTlqFFcF7Zx/kgiyInTvY7Sj9CpqyRC4U1+NAdjSNJuorQi8AR
	fOTQv1fEnpCQxjlK4wN5QIm5ak/W9DFq5wFg2m9ETBALhvbdtfQnS/sOw1b8CjbWVaasi5lH+Ae
	V2E3ypEgyvnr8DMhN53sNVY8SOX7DRa9rPSSxdQp97u93FnpZCohEWN3xQbfPJhjoUTlCHOwmfd
	NofkrolYQGek4gvVKBN9p/dTGVN9P4L8Mk6R5VjH0/c+sMVmJsuSW7v+kHPneIER9qVBUcLgm/N
	RW3WHqGYxLYiglIOK4l5Fk9OSS93xjA2PQM1WAwoiR3/A23XBiOe0Gp28Wun0+SOBI8zUOls7Vr
	4jPFlsRpQL/oolmqpsjAgLV3w6M5Q0g==
X-Received: by 2002:a05:690e:2510:10b0:62f:c634:4b3f with SMTP id 956f58d0204a3-63e1616c2e1mr1013794d50.7.1760643237984;
        Thu, 16 Oct 2025 12:33:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMio9VLzQuuBpiuwQhgCpujKJGVl5WrcNOxS8afEZSVyzHjxnIZGruiRbFQ1+FjVygkA/akQ==
X-Received: by 2002:a05:690e:2510:10b0:62f:c634:4b3f with SMTP id 956f58d0204a3-63e1616c2e1mr1013781d50.7.1760643237561;
        Thu, 16 Oct 2025 12:33:57 -0700 (PDT)
Received: from redhat.com ([2600:382:852c:bf2e:3d5e:51e0:852d:1b05])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-63e1983c9f3sm83895d50.7.2025.10.16.12.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 12:33:57 -0700 (PDT)
Date: Thu, 16 Oct 2025 15:33:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Zhou, Yun" <yun.zhou@windriver.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, dianders@chromium.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] clk: fix slab-use-after-free when
 clk_core_populate_parent_map failed
Message-ID: <aPFIohBAaSnv8YUB@redhat.com>
References: <20251002061215.1055185-1-yun.zhou@windriver.com>
 <9c8a8df4-f69c-4407-911f-0402bd06f4c5@windriver.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c8a8df4-f69c-4407-911f-0402bd06f4c5@windriver.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Yun,

On Thu, Oct 16, 2025 at 09:25:20AM +0800, Zhou, Yun wrote:
> Hi Brian,
> 
> Can you help me check if there are any issues with this new patch?

The new patch looks good to me. Ultimately though it's up to Stephen.

Brian

