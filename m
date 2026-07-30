Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E962BEFEF
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 16:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785430771; cv=none; b=SLvgc4XXUIRq6ICR7h33bZYGRgxJ95yMvkz43r3thOal8JwhoFPq464nM6UlN8jy+GwSXCJK0VAx1gZBfyVOGVqrUSTk1MpkMS+93mHcvuBxk0k7di7QiUgXEIbGz0pYmokGQl2wJBeT+d+Whnx1amLMF/NwNsOdDXlSWL1LUUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785430771; c=relaxed/simple;
	bh=3lmQCYzBha89kHS+EhbYd/cgSpjuQhReEslTXaDFnAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uox1N+daQfTmVXPTuYNkxXJf50iIiBWXIMmXmtnp09yTEjyEZ8xnPjnIfhEIH9bVemRniUnik5QdB6kuppXjm76RpPzbVHmmxlXXiFWa/5qbWtHcphwTTcU00/McimcMftLXIxX6qglCNMhnxpbL+9j5vDCSNDL1H9YODJWRXr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GO9CPQ6I; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oYnhXcqU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GO9CPQ6I";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oYnhXcqU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785430768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4HX65Ch2e5L/H3egpVLAiomgwfoL6WwHR/EjKu9aKa8=;
	b=GO9CPQ6IQoYag5X7kWhPqr1CtNBnVmkIUTuyYTyRvclkGqmBxDiEJZ45og0dp1LuqGzS9A
	JnpZOU4FW7j+jZS/CT228FgpWFlwx+aPp8oG0+Cl+tRfZqiEPL0wn3vMpwW2imQAbXoen3
	wsaLqEnPjij67mxOjzY31pswHTIRgf0=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-37BLc6OGPF63qtagUHhEeg-1; Thu, 30 Jul 2026 12:59:27 -0400
X-MC-Unique: 37BLc6OGPF63qtagUHhEeg-1
X-Mimecast-MFC-AGG-ID: 37BLc6OGPF63qtagUHhEeg_1785430766
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81e71be771cso27100257b3.0
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 09:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785430766; x=1786035566; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HX65Ch2e5L/H3egpVLAiomgwfoL6WwHR/EjKu9aKa8=;
        b=oYnhXcqUcjsMrk9E5LMHW1GE1Hpst9oTNgy3P91XbylN1WxW4oCXhOLYPY7JRI7lnc
         OM8Me+gkQKi5SF/nw8Or3IxIkjh9xLTDpzJdEs2w+ON5+ezI8IUQeEMGVBp++twecGmS
         oBrmH9sVwKCg2j/g8w9AK0QIKHl8eCmC4KVCAK+SY4Zss77qmxKUDboFomSwYbn0XUuW
         p4PrIldcyH3+wZACoMhubKE/y1mgjLPlCC3Dheydn5RWaT6W+a3/8g+2CafT0e1zcFaD
         J2vHMFUw9cHp4v6DDaNIZBvgXfLQAW5RNuLMbUKoFVXdhU7kcDWAJIdUPVuVBD/N4NAp
         Vwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785430766; x=1786035566;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4HX65Ch2e5L/H3egpVLAiomgwfoL6WwHR/EjKu9aKa8=;
        b=bhE0zixma7FN2qfvQJADRMdL9cybshQf7zUmloZzlu9ihxR+FAX+WICwVhxhSRXak/
         mjSJUUYQcCdWGixv5OK27ptHLWHuQhO1kUwDPQe9OUpIcYnoKOC77+tVcoDxclzSxa2+
         stoa94pgeW204apZjxkx9u9PrucFznsikrZSRxRT3bnrFSqz/66OW2gQKbLqiwKHT+Ey
         tCo6aVpbGm/YuT/uTmw/eIuJAWpYOjnfazuSqY5zzCo4e2c7vmoQqHDkX6JVOE+BCM8f
         ivuLhHReQ6ztJqTA4Yz5JQxgiUafTF6R6WmueV6zVMf8XvAbr9y47/A0/Mz7an8GMT73
         oKPw==
X-Forwarded-Encrypted: i=1; AHgh+RpF6RNXgKZnoMD4CF7rfrdh1ENPeDAmExT0u3tPSB6spXEoa8Uf9gY49H6GGcw93b6d2CuyvVju4JA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA986Q5mrwxV6eyzp7fhenYjqo2so5LpXhFnbZofLFLqTQQo/y
	3uDAhD+IF7BQjjByzXa1a9dWoXVIUGjP6m5svvlhk41kzg+EfDc5eI+hWnvQbWENPahQ8bFzXiZ
	iIb4Q/zmGp2bZgVnhU88oJju4fNXbOyD3UbFPzHxwgJBJrIq5zCggFWSj4nv0ug==
X-Gm-Gg: AR+sD11dKjDVUO8+qcGVeobUW5WdDBDKoPToZP+W2TEcz7zwFURLpW9gxVcuBy7mud6
	d4+jpZaC0Tih3CqmL3mFK+oVIRh0DyjwI3ymPVV2TJYrlCHnIqWd0z7A4SJkAZ20ER25hly1kPH
	NtQJL9eL0teFJU200lJ0bTlAmO88WZLh5RlabsfnrQ/A0MHdcrwqUQKeqFQIaqHSq1ItMGOA0UZ
	dYiQqb3EfquYVVpfP32stOZk8hSgYI9f/gbaXGITIb/GziatFy8gz7HPwQC0Qe8VGShUnT7DuEB
	gndI7QY7wYLWHwhi6BlFxlZpwRgPxiKBlFrvUyRDCEiSyJhE6JdJzzNjCHyL48ANnfL9e64fmFU
	BKCgvRBr3YxmsjU7Khd/5oNM6XdBgC4y0GL0=
X-Received: by 2002:a05:690c:7204:b0:80c:88b8:2dd9 with SMTP id 00721157ae682-81fc1efa6cemr7837077b3.35.1785430766525;
        Thu, 30 Jul 2026 09:59:26 -0700 (PDT)
X-Received: by 2002:a05:690c:7204:b0:80c:88b8:2dd9 with SMTP id 00721157ae682-81fc1efa6cemr7836827b3.35.1785430766105;
        Thu, 30 Jul 2026 09:59:26 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb8af2969sm13718907b3.42.2026.07.30.09.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:59:25 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:59:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pavel =?iso-8859-1?Q?L=F6bl?= <pavel@loebl.cz>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Add support for Si549 programmable clock
Message-ID: <amuC68wkwgNL6I4i@redhat.com>
References: <20260729115310.3490589-1-pavel@loebl.cz>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729115310.3490589-1-pavel@loebl.cz>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Pavel,

On Wed, Jul 29, 2026 at 01:53:08PM +0200, Pavel Löbl wrote:
> This adds support for Si549 programmable oscillator. It's almost the
> same as already supported Si544, except it uses different internal
> oscillator frequency.
> 
> So new compatible strings are added, and driver data is extended
> to carry both maximum output frequency and internal xtal frequency.
> 
> Changes in v3:
>   Added missing xo_freq member description as found by kernel test robot:
> 
>   https://lore.kernel.org/oe-kbuild-all/202607291708.qFSxYL2s-lkp@intel.com/

I assumed a pull with v2 for Stephen here:

https://lore.kernel.org/linux-clk/amjbNiVjm5HkPRu9@redhat.com/

I don't know yet if he's going to pull that. In case he pulls that, can
you post a separate patch for just the xo_freq member description so
that we can merge the fix separately?

That way we'll be set either way whatever he decides to do with that
pull.

Thanks,
Brian

