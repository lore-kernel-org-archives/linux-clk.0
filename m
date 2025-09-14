Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63912566E9
	for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 11:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757850990; cv=none; b=W1EVE12/mHRUaCvWapvg14IDEhXu21bj6Z2k/FbEd74if13sCPMFx4VvIg1eIo93VPja0dLrv9nazusr4hZ33C92Z/kjRcp+4iPNHLWz0et+g0AJ0V077vWZJy/DRLEKisNxeR2NUFETmWg+8J+bjSaaURE97xW5hAUEKN5AnKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757850990; c=relaxed/simple;
	bh=Q/faH92x8o1ZYl58qCPToM/QxD4OzW0eaDhoowRD1nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2WpG+340F1+FLXn0RdZHOibz0su3jWV42rmyWcphKK/B6Y/ftYbr/YRzmNGfVqYwntT1h3dX8bTFRYV+cPDayjFSWLP0VMCtvh/qibrAu3vgTNOmJpOVZ3X8Yd96r7/0QuO9Y1pnTsJp0gBRtxQPm/DYqdkAvoKnbPO9q4uNw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IOevCH1U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IOevCH1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757850986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V7EEVogNqm3h2fGQuXoQvzBFJfVHtUlo6y8LaBgKxgU=;
	b=IOevCH1U+udPzLC5GYXLuB6JSzGjrKzr6wFeUrPtwTIRjZrV6YiATbv4hVAM18bpln8EDA
	FMaHDazKr9/ukHqsU/698VliPuP7c46FpkXhM9gekBgAA3CFQzeHWS48OezirSrSEVuImf
	A1JgZevfKhq22eWiqRIcs79KZzDB7mI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-l2ktaTcZNSuceNGqh942tA-1; Sun, 14 Sep 2025 07:56:23 -0400
X-MC-Unique: l2ktaTcZNSuceNGqh942tA-1
X-Mimecast-MFC-AGG-ID: l2ktaTcZNSuceNGqh942tA_1757850983
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7ff94e5c251so910565185a.1
        for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 04:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757850983; x=1758455783;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7EEVogNqm3h2fGQuXoQvzBFJfVHtUlo6y8LaBgKxgU=;
        b=bEO4phRPBhfUr7CsOpADzBKOc/uiwqD7K55e1UmciLAYhAuChnhZHhCs2QSEEsoQC8
         swJtF3gbyq0ligs3JJlN12vJsNlzMRoROLzNt/f52XEEHgQuHX4O5J8x3Sw7cethx3wm
         NAGD6FH8ySNquQHeBzcx0WbY3Ux21puCm4v/fY34WSIoRw84aRyE2ZWswllcRfrSnQCa
         gvz2yZUYRi/k6Tqgmkpqb8IGBXfeSqF15O9L5+gs7uCOjag//fqN+fw/2RBkU5/f3/K2
         u5J736YAweoJ/ZFMcHL8HW/RZ+tKwjycbRjyxr5NoV2w/V12nUKatj2XKSFFCdonMBrp
         +LZw==
X-Gm-Message-State: AOJu0Ywt3Dh2+NT1mi5zn1HAH8Joq9aHtLuSV3m3G05+7+14utTkcJPP
	AxIKryth5sX2GH3er9TFWyxsdqOrgVgn5TjExlatT+mrRaaLw7R50Cw2e/Vn8gZ1GitDBzQWg1D
	tPx10AkFoCktPPX5cG975xFgqQb6WmUm1qbzf68+zOZ6HbkCYXB7lxZzsMOlrnQ==
X-Gm-Gg: ASbGncuLq84NMYGcYsKxmpKUiWrpGj4wBYI9y/7L37YCMiAbn/iduGi41dvbFAJfxPe
	fbwxTkn3Q0qNu7hhCUklOakjl5FpywrZzcbfLWxu5SBEonoVFnY9xduooBtdBtCuBMHpSrxmHJ2
	75AbGWKwRYiJQvaBU5/DScQh4Cfmx7/raCUg8xQb+fIElgom5eAOsfI5UtdLAlQfgZdMw/zCB0o
	e4AK9XOPL3dvbq2cvkaAFll6HCmwmAjpuUQZe3Faywznw7kn04Ug7nVEx12yBtivCQhVbyTn4KA
	G1OtQR8d0zdvvU6wMT0OrE8p/51gE0e5B56W43Fop+YpjFnU8hRtMng6WSkEN/8fF7Q9tuz9H1H
	Uv4iLzYJzdT+SFZv1tVMOSMRSDkNaBPM=
X-Received: by 2002:a05:620a:414f:b0:7e8:8f35:1d2b with SMTP id af79cd13be357-81ff181374emr1625000285a.2.1757850982923;
        Sun, 14 Sep 2025 04:56:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjgXFxjwySPCU3ek1M0DJbAsGYTyjXrUec8xKOuYaZ+ALRKNikNG6Y3NJHY97G0hh6czoOhA==
X-Received: by 2002:a05:620a:414f:b0:7e8:8f35:1d2b with SMTP id af79cd13be357-81ff181374emr1624998885a.2.1757850982589;
        Sun, 14 Sep 2025 04:56:22 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820c974c848sm587652085a.23.2025.09.14.04.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:56:22 -0700 (PDT)
Date: Sun, 14 Sep 2025 07:56:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from round_rate()
 to determine_rate()
Message-ID: <aMatZAX6eFI1RmDH@redhat.com>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Iwona, Joel, and Andrew,

On Sun, Aug 10, 2025 at 06:21:51PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> appended to the "under-the-cut" portion of the patch.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

Thanks,

Brian

