Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F99480DE0
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 15:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779119548; cv=none; b=cJaFUY8auFWYpUmogbQeDscUzrXtmXcZU6UWXFN9imJ7nvbaS9mJuBjKbCOzCp8G9SRX6gZqQxRYp6elT8xYTXz1BuVXn6McuNWQO1e33WJPLfW/SF9jhUGUXaW65cymFqLFknCB+/pE+SYLIdTMhpFQQL7XqLQUjnTYIGkUJ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779119548; c=relaxed/simple;
	bh=YiTwS79bnTt/Nua6+DyRlP8IChJpOF59JAGpvQImZcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDOCb/dRD2lBrB13ArlWXuarCyL7XCnySQ7LBg0Cd5OcCDEsyZKLSZ36smDkTEpJPd8apUpXahdz6wPl31CC7gJ3iKv4i+w0iwolozSxUM9YA+K0sKcrGylxfFyofpSd9Hx9iRJ81Zbo6+XnuwppW7Ak/H9f6zakIhsYfzzeJMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d8E32VHN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GqUHvuQz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d8E32VHN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GqUHvuQz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779119535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gAI1hXFSj+uGK+1EPEBwy37aNgSLWoyZVZs64occPdo=;
	b=d8E32VHNVSD32phFXTKQFGIjkhdfIElF0FUMIEnXyqQBqh1R05T1mayj15ovYTGzhZXODN
	Pavi6cKUEAuDuj5lczKlRTnhSNnhSHJoiC2RTPaNzAKLNZMku6P7n0nJTCcQ7afr2w9eAI
	H+Tcekp3LkSMD4AEVJpEvhG0D2UNHug=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-qIyCbSfRO0ueTZgpKwsoSA-1; Mon, 18 May 2026 11:52:14 -0400
X-MC-Unique: qIyCbSfRO0ueTZgpKwsoSA-1
X-Mimecast-MFC-AGG-ID: qIyCbSfRO0ueTZgpKwsoSA_1779119533
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-913dbb7a318so429501685a.1
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 08:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779119533; x=1779724333; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gAI1hXFSj+uGK+1EPEBwy37aNgSLWoyZVZs64occPdo=;
        b=GqUHvuQz/BgjdJO96Q9dkjD+p+frihcXMuVUCUNv4LBVgJc/CMgfz4rQzG8JNc++mV
         cEbUcVMNyzeiLX04TNXJrWZbHZchFpGgg3o83tKZEiop7D3NTpe8XV6dAjlXXy/nUb+1
         l/hprwavTbJbagVjZySwxpOZOGI0UlucDaVtUfxaYZC+3oKZLSdRExS62aWjbBsWHTPp
         GV63d5dZbtzR38LIETbtu9CKIZ9CpZbMoF5lSrXME+xKU9RF346L6e1Mug9HZDA4UEoQ
         3GGsAPaXREHcRzetZlnNHN3VbdJnRWTQn/sdEtJkg4IncA0lCSEWup14CgLzp4Gpe9Xb
         K+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779119533; x=1779724333;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAI1hXFSj+uGK+1EPEBwy37aNgSLWoyZVZs64occPdo=;
        b=X/D4CTTQcUjb94AzCT7cmvSUB69p76enRZAwFX9W4G31f1wf9boRbEXidK1vUwwHG2
         USBLvb1L7MrzZBfkwU+tJAcaoEDCf3vIUnqRxA8mZb2srQy//J9AA2JfibmLNaMJQFQE
         bu6ldHiho53EETDZp87vSZ141wLRZjPiKYz1ymb+UM7UCD2KpDL5nJgfTV7BwonfOg6u
         /hok10K5ZDvGXfOnxQTPgzO2thBiAqrn9WeTFBBaBLo7+Dy2kBtoGzOo9ouHcV3QBiW8
         cwIxT3cbFmrFIg62zr+flmV5VUQhpo85+qylGGjLIvQ5euyJkflq+ZnVkdfBRxjfPnjY
         u8Fg==
X-Forwarded-Encrypted: i=1; AFNElJ8mCv5uuFPuvFuD8qfJsvDQVsyNmhHZhxqtmpEG0SEzztWmQOQnoHLzui76jLtvgcXzrmq14XXkYMk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7F0B8tVSi8vxFSNPik17mNk6nPjZjlCtQF4KTnp9roC6rfX2G
	SKUQN3/j4d96ofonkzTSruWH8wA0vRJyv3djMsDRc6pLDXjhHZmfOv7GcYRoEgmMtKRtrPA18jh
	tKtrqbya8wHG+4YMerdWvVufQ19oj/KKaUbzJ3kbg0JifehQrHl3n91n1EVzo6g==
X-Gm-Gg: Acq92OFyXlGtEgnq+rUxQfJRwrYO+10HUSMlwU+HRF1OvswhjeEDJkH311CYSiZFa2a
	ymO8pvM8uYAWNH1HqsjOh2QPLJw/FrOmEQQt/WbmmVs2aziJCa5F35uKgdmb4yussiV6bHc2ALU
	++zaZvxmYwd1dMdhr7VN5IJnUDkf1svnJubrjGoxSHFndY5pxvMBDSDrbYdDeXHKyTaY8AUgMGr
	UbdLHpvdqiuEOKeMzJSoCMIjEe5Xu4m7GGgE5HvrsIMldSYaOcf7nJuQtdxtNqr1rlEExaq4dia
	GlW1vUuxRaMRpf2Gd8zA8M7XG7vHI0grFIwWTkmnVemXFBtpkyiR1IRVrtOY7Uoo/ZrY2rw1unl
	IWwUeSeCqpczSOhZxXEleYtna7Mk6yqgMPYhPU+wN2m++02m2EswIuIwn
X-Received: by 2002:a05:620a:711a:b0:8cf:dd93:aca5 with SMTP id af79cd13be357-910b0f0ef01mr2496015485a.34.1779119533621;
        Mon, 18 May 2026 08:52:13 -0700 (PDT)
X-Received: by 2002:a05:620a:711a:b0:8cf:dd93:aca5 with SMTP id af79cd13be357-910b0f0ef01mr2496010985a.34.1779119533156;
        Mon, 18 May 2026 08:52:13 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bae27359sm1601082185a.17.2026.05.18.08.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 08:52:12 -0700 (PDT)
Date: Mon, 18 May 2026 11:52:11 -0400
From: Brian Masney <bmasney@redhat.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] clk: Use named initializers for arrays of
 i2c_device_data
Message-ID: <ags1q2ec_6RopXPr@redhat.com>
References: <cover.1778857289.git.u.kleine-koenig@baylibre.com>
 <3a193d91e64703892900b62709bd1a67f540f39b.1778857289.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a193d91e64703892900b62709bd1a67f540f39b.1778857289.git.u.kleine-koenig@baylibre.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Fri, May 15, 2026 at 05:10:40PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
> 
> While touching all these arrays, unify usage of whitespace and commas.
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

