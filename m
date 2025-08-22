Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3472FAC1B
	for <linux-clk@vger.kernel.org>; Fri, 22 Aug 2025 13:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755868861; cv=none; b=C/MacaIjpAQEt5phOGwtIA3y7r0zmBQXrQdSnyLta9zfmxeAO8xY3qHp1zcw8VD7ZYX60052k3kgiqOOASQkB3XENjJF1jynUXfzGaRmt174KgUE5zqiD/H130q1ZQ/DMqQGIjK8vR7ZnqRpYwPQdygWVE/Uyix6x1A7yYSru/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755868861; c=relaxed/simple;
	bh=RLk4D4vD/TDD8BadjDyMjnwONRBMR+yTQwbOQuHgP3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhhNrT3+13Kp3TMWAkWHgmbKZgdPnROP38qvaV9lO0c8JUy+fTDG6an2dtC2ARrel9dyJLbStZBefb0GwlgWKFxQPALXT55avoM3b4L4Wp/R/uwLhdfm+aBE4ql95BUsMdBTa/MVdoHKRI0N1MHr9grwmwv0LEDZ6aHm0ETPZ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bhsZ5zAm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bhsZ5zAm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755868858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3leSXfueIJ7OjI6bMt9yYc6dreSLbCTLjK5B3khIUcw=;
	b=bhsZ5zAmphH9jEZxu8LDouEg0FD4M8zdTt1JfhtbwuUES7adCAm/wwgq/vB96MMQkXqkdm
	i9UVcq3ciUf5MhkhAVaW3IofTPlpsgEDc4SxQwSAoHzxVS/OWQC+sdzi5HIWsgmoV/uI2U
	Dl2d+kj/YcJUX4CfTTc9cZ5VzUhv9yo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-Nwp4PW4NM_OgX32eq-Yi_A-1; Fri, 22 Aug 2025 09:20:57 -0400
X-MC-Unique: Nwp4PW4NM_OgX32eq-Yi_A-1
X-Mimecast-MFC-AGG-ID: Nwp4PW4NM_OgX32eq-Yi_A_1755868857
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7eb98119838so11139285a.0
        for <linux-clk@vger.kernel.org>; Fri, 22 Aug 2025 06:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755868857; x=1756473657;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3leSXfueIJ7OjI6bMt9yYc6dreSLbCTLjK5B3khIUcw=;
        b=Xxf+HPG7EQh/4qGhytJynOlqJitDn6tpWd5YcnPzLe1WTZv8Qnfvt6fBZR3kF5E+Oy
         pPIAzGJkANFQ1ExEbKcVJk1AA9lR9kPHZms1BKCipGwGNkzJz8nQfnjozV5Oo6xFtPi6
         UC8QqCDM9OjG6qpl0K38QorgXws8tFjXuTyamDtNKsZb+Gaqqp6zli+C0bKvo2hxPObM
         YdnVJE89+m0JFJq75Yaxrub54MDU15ySlnQuqPHqRqNMW+iTjUWt25lNjKZAPioQrH6e
         jCEx2xWmvsgoaLn0z+BcX0yjPc3Gd3OaxeQKm9lsf87YmJy7QDNureijSXya6WCLYYih
         olMw==
X-Forwarded-Encrypted: i=1; AJvYcCWUDgXLx/ntVMmdhx16fTOq/WETe4xRAQXleU/e/heH1ec6wzjMpwbZhtdcFU+Vy9McWPsbNbNQ6EY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCc208o5Fn0FAgN97bQLd2XsT5aNpbqEN/h8a169D4W8GHKz73
	TFXFZN4SYxd2hAFZ4s/9Zl22MtTu+FdVFJWqNp2djTJMq9LeGO4OTpUUZL65Nd/vmIPcG37+OU8
	UixDleB56gaXTTxCjNDzoT2H85wKx1SzbsJs8c5CWAUEDUs2Lbaz0oL2/fjqNZA==
X-Gm-Gg: ASbGncsL4+4nvTNf6fae4/nY6JJTXUvdAwSJ2d1joqNrVW20ez9KV0o/XxFcIzvVM1i
	C1kTqfOfztWdM0HxBZ9x4+6m8GspJ5xa6Dg55hY790sXBs2TCHPTOI7a1la7hmHY4Mq9AILFub9
	8vhENbfsQTAeCeKtgi3o5pzS3cyoIjVnkfdx8gAkOuTqGf4KDAqdzknVPw5WR14M69C0pskY9Ug
	bMPM7HtOHVfUPN9e9PpZh/+hy9XvXPlnylKp2PVwyFR2TErRnCU5WBfFw75Fok5rJCrsNYQ59Pa
	13lb/nk5Oi85VlGZciCgV02cDPHF7Qi4okOyxVck5KkFY8RRZ/qBNZL2ftKt5izjPJYjLh2AVE+
	Db9szNUFxwAQw/L79Sqw=
X-Received: by 2002:a05:620a:4723:b0:7d4:3bcc:85bf with SMTP id af79cd13be357-7ea10f96d7bmr350319985a.12.1755868856679;
        Fri, 22 Aug 2025 06:20:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJT6pAPKYEy5K11CQ9yMu+8+XejnwBM/iicip7wZSgoCGQVpWGHpC8P6vRS4lRcd6AamSOvw==
X-Received: by 2002:a05:620a:4723:b0:7d4:3bcc:85bf with SMTP id af79cd13be357-7ea10f96d7bmr350315285a.12.1755868856078;
        Fri, 22 Aug 2025 06:20:56 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e19211asm1338828085a.51.2025.08.22.06.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:20:55 -0700 (PDT)
Date: Fri, 22 Aug 2025 09:20:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: Use hashtable for global clk lookups
Message-ID: <aKhutc0IVWun83qF@x1>
References: <20250814035317.4112336-1-wenst@chromium.org>
 <20250814035317.4112336-2-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814035317.4112336-2-wenst@chromium.org>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Aug 14, 2025 at 11:53:16AM +0800, Chen-Yu Tsai wrote:
> A clk lookup using clk_core_lookup() is currently somewhat expensive
> since it has to walk the whole clk tree to find a match. This is
> extremely bad in the clk_core_init() function where it is used to look
> for clk name conflicts, which is always the worst case of walking the
> whole tree. Moreover, the number of clks checked increases as more
> clks are registered, causing each subsequent clk registration becoming
> slower.
> 
> Add a hashtable for doing clk lookups to replace the tree walk method.
> On arm64 this increases kernel memory usage by 4 KB for the hashtable,
> and 16 bytes (2 pointers) for |struct hlist_node| in each clk. On a
> platform with around 800 clks, this reduces the time spent in
> clk_core_lookup() significantly:
> 
>           |      PID 0      |     kworker     |
>           | before |  after | before |  after |
>     -------------------------------------------
>     avg   | 203 us | 2.7 us | 123 us | 1.5 us |
>     -------------------------------------------
>     min   | 4.7 us | 2.3 us | 102 us | 0.9 us |
>     -------------------------------------------
>     max   | 867 us | 4.8 us | 237 us | 3.5 us |
>     -------------------------------------------
>     culm  | 109 ms | 1.5 ms |  21 ms | 0.3 ms |
> 
> This in turn reduces the time spent in clk_hw_register(), and
> ultimately, boot time. On a different system with close to 700 clks,
> This reduces boot time by around 110 ms. While this doesn't seem like
> a lot, this helps in cases where minimizing boot time is important.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>
Tested-by: Brian Masney <bmasney@redhat.com>

I tested this on my Thinkpad x13s laptop, and clk_core_lookup() is
called 684 times on normal boot up of my system. Only 4 of those are
duplicate lookups.

Brian

