Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200C028D8DA
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 16:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781801353; cv=none; b=NtATxGl0pX/Y2QVcPKfjTnJTkEqvcK6FzmDZC7m7DQaHJbsy58w18jrZaZlB/mBxiq9U/Ql9ZxiND64NQPUjyVTv1QT+o0pxU4fQz4bEYIGoBTMElvWVxZL+e67KR3Q1X0AewySPhe7zghaLexqQ+MY2HCmhcnLpwBjX0U6W//o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781801353; c=relaxed/simple;
	bh=aGdOuab/Oz/04Rgx3xTG4yssGlXpJHiuyQ1pTDFYYbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHMcAJcYxI8wGF5Ddli7RL5O2Q2kb/fbNapEPDWck9QEf+Rs2IpfRrsbTPc9JNope7Zx2p0vH3jeFiLLKPVP8UNOWEzzx/zUUB5FN4o3Vt0gfz8dEaPpqYFwRrkOzYHrUqhDEWsnHB4icKISyF4YpzecydewERx9PGXUuLqLXVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FUTUvzMj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hUtftKFC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FUTUvzMj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hUtftKFC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781801351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qzIerF98rNDz/PxgXqfLSKEi6qLn6V1Cg7XqhPCbaQk=;
	b=FUTUvzMjgetK1TptEWPWkHLEcat49FH5h53OHMIoQDxaTMukRwBCJVtVlgR6HHMk4TsGr8
	krd8cOMS9+JfGbVVP+0tIEp44M+bq49Y51w5Md7YUlHKOsgA92BReDBIzkHUEo8u31Q7+w
	NdOYtSoOYsOfHId6J+GNqUlfP+bO2E4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-711-VHZIhZqWMumxZqXtOGdyEQ-1; Thu, 18 Jun 2026 12:49:10 -0400
X-MC-Unique: VHZIhZqWMumxZqXtOGdyEQ-1
X-Mimecast-MFC-AGG-ID: VHZIhZqWMumxZqXtOGdyEQ_1781801349
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51776d4355cso51752031cf.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 09:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781801349; x=1782406149; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qzIerF98rNDz/PxgXqfLSKEi6qLn6V1Cg7XqhPCbaQk=;
        b=hUtftKFCmrqAVNgkzA+SA3s+P8FVXUdqPfkFaZ9cjPBisL7H/mgfbt9SMBsDeNJhvL
         gUpVCp9a4avwHfcb4+RfujQ6sgjmw3BvE6D1iPhRh4ngso0pyzj13YmHVpDA9ugVHgIK
         VjLY6hxLEVSoFRTPNaBCNDrX7LeOZfNRGQMcggoTSH+6mj6mU1g1z0BZg3n/qXlkRlCd
         ivBDWIqsor9KNjFWwNvbaYex1irsqa1tBqn5Y6GzaG4aG4fMPwkPUEa+Nccnnv8J/UHh
         pBH7TxEF/0Ni4FrPX0tQ/MCfDJHVFl7anUbV8S+6/s8PG9OUr7Hp8S4dRSXWN+emYM5j
         vn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781801349; x=1782406149;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzIerF98rNDz/PxgXqfLSKEi6qLn6V1Cg7XqhPCbaQk=;
        b=Subekt+iixWoj1CfRGguXNSib3u9AuOqn02s581/Ov9nHuxAS6yqwjntzAaH1iLSRh
         wGGMLg48FSgLR74dsatknlaENo5/ZMXCQYo0pPi7+MarbIAtl/aqzJg6lRcrpjNX6rYt
         ziJEoqlk1vVTODoydmcYOpssb7xCmePVyrAd93nHy0M5gzSwX0jVHGez5D8QBqC/4Ogn
         hJ3rrq/lawVN7WQ+lcyvx05zaV/NcjPYXwYKHcMpgZYK/a8lxqeVtywc0hAKvQkzUSHV
         jG3tZiTIlsWvmgOVdM9un9eOcA7qlltUROF5hnHIR2lqqrExBJar3OuZTdaUtxFy38Ru
         DBzg==
X-Forwarded-Encrypted: i=1; AFNElJ8RRkC1BqoO09zmngFywbJ/jS5/aDDIHS0khjs0ERJeaRDrOIoRrrgNJURSv/WhNrx3Er0cQP4U0/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSwW7thEce/9CFtzwt0Dh+ss+HqEwt+9dG72Tgt3GSkvwEK7ZF
	a7aP4dRLnnBcNscPXw+iVVIzK081JyDhPmP9YTaawxUUhiDOA5StuijcrmSSLq4h6BrTFpsD6Ln
	jcRhUYuLnCKjqG1zDV3IaaT02cO4EGOXkNX6SvU/ks3lSVNB0lDRplpscN8i5Ww==
X-Gm-Gg: AfdE7cnx3JVzu/fO42fztkq4gE63ucnhZrvFOY2z2UzFAxPTNyHYw8A0vh/uiPzW5gA
	d1SLAp7NXLYLhEKzm1Nqf8aBW/Rhs1RHQMCPHNYpSN8L/KjRC+UXTrpclyXUbJi/PciTd/2ytps
	sEABmboRwg8GfBCTyd+3qIFlKHsAIlJyjsMqAK0zbAFuDLuQm6DqaExs7mBZ8fyrKBQfOY0DgmF
	xT4zd6R/MTlUd66/CR2Q7IFcg4ZsoC8xZROpEaUwXRKOJuLP9EOUbLvs27mKOqnH/txsrffMAnv
	93eRIQaRUfVWc9CFMY88v2i3J/mTRkjRUUBcTrSywYthBDPb1sH4fQmXYMy+8LWRm4cMhlWOjrj
	h8z7I/kEzCayDZmR19PeZGEdrJ+QM/PaNxA8ka315DafySQ==
X-Received: by 2002:a05:622a:96:b0:517:91e5:108d with SMTP id d75a77b69052e-519c4f56936mr58721191cf.42.1781801349389;
        Thu, 18 Jun 2026 09:49:09 -0700 (PDT)
X-Received: by 2002:a05:622a:96:b0:517:91e5:108d with SMTP id d75a77b69052e-519c4f56936mr58720671cf.42.1781801348872;
        Thu, 18 Jun 2026 09:49:08 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb61fb15sm201220721cf.5.2026.06.18.09.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 09:49:07 -0700 (PDT)
Date: Thu, 18 Jun 2026 12:49:04 -0400
From: Brian Masney <bmasney@redhat.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: clk-lmk04832: Simplify device abstraction
Message-ID: <ajQhgONg0vfS6VQY@redhat.com>
References: <5f4e100b3c2b5cf3ca1faac4ce1b0ffe5c9ea6eb.1781798524.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f4e100b3c2b5cf3ca1faac4ce1b0ffe5c9ea6eb.1781798524.git.u.kleine-koenig@baylibre.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Thu, Jun 18, 2026 at 06:04:55PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The driver was introduced in 2021 and since then only supports a single
> chip variant. Simplify the driver by hard-coding the device properties
> instead of using the id_table's abstraction for a single chip type.
> 
> While touching the id table, use a single space in the table terminator
> to match the most used style.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

