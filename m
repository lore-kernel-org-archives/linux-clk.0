Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CE4328603
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 01:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768526602; cv=none; b=Fchl7sojEAF6SZe8B9s3c1D7Vv0ctUM4zx5vTa/bO1bWtLRHI88fDPzmynF3bOinaarCYiLncgVjoRmlm0btqpsejdNccSd1mKbOkitUJfuBSqvihAy4FoTk+tN3KQ20CfuVt8whWJ++0er8AEtXay/xS6VMjvPeNPfCB010Rgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768526602; c=relaxed/simple;
	bh=R4xvYuUEoszUJEy7wrMslCnAbmam4wC/SnRLPqb7JyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uu919AaxoGVnRVFS0kEsoxXls77rJKLmPS1CN5L9OpTHWn1MJwffCE0CjY9p8LncXu/HnOhkGWqxhrICxPyfUA30XY72T5DhnoLqZk6vYH/TJ0rC6BmWhhN+eJiXlrUIzjjHm/s2zQCz8hM/QOZ2UiPx43AM/GCQ1GiOb/nFHM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G/oOI5xT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=B9C4LkeT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G/oOI5xT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="B9C4LkeT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768526593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sNCU18zVmIawu4LQkxTSRVBM2Dsz2DQMMKhUjFF4BXM=;
	b=G/oOI5xTnWfOhC2roHhLG4+kJeszC6DkTE+2KRY9SVvJ7b7XpV8DeD7tYdaufm9vz/u89n
	njYy2jsyb8irzKGnSkbHe47IJmrvMUw896ZDvwuVKyzci0CNBiBN8i7kMmMQ8C5+3Ne+1x
	HPADrCBeQG+77ArVlSF6C0M27xHtGW8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-O32lV8oOPeqDVewzAqH9Mg-1; Thu, 15 Jan 2026 20:23:11 -0500
X-MC-Unique: O32lV8oOPeqDVewzAqH9Mg-1
X-Mimecast-MFC-AGG-ID: O32lV8oOPeqDVewzAqH9Mg_1768526591
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50146d98660so44852491cf.2
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 17:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768526591; x=1769131391; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNCU18zVmIawu4LQkxTSRVBM2Dsz2DQMMKhUjFF4BXM=;
        b=B9C4LkeTHsv6krppEts3kxQ7DOvbW302fk1rzwHmFZhQAMna//OdlT2g+7F+atHH0X
         3N6ag2ylH6+JEz+Jeq2mK09KazrPg1gi6xdVM4CRSx1NnggEjbGZkQO2T+vapMWwukIJ
         qxepEwexEqeKJli/qdrS2FzSZn9xyNSSbZAFij1T+wS7rCYXa1huJdBm2/qiT6O72pD/
         aOFDPA350R+Wnmjipgj+QFSlSBKqHCpXkxaVgg5YAtBBdX5bsfCin/i5kgzAtqSBU4tv
         kEq2PDC3pHTB2IA5b/eNj79mFAYBWJMlb5t/aypWj9b+7/ugSee+6FGT046O4hW1Gtjy
         tRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526591; x=1769131391;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sNCU18zVmIawu4LQkxTSRVBM2Dsz2DQMMKhUjFF4BXM=;
        b=DLc0SOLe19G4Q2VeaHE2WhiV656hsKcvDafpifzSukyZVE5fxWYQMrhEYPdWFI0JfP
         7U2LUkPou5B883kZh8C3b7h/pwOxIba1YI+bZ+/snRfJeUmmsBplYfG9r+Vxzica8OHw
         igOs4VI65U4VpXrchNmZXOzCGMqyXADt9aAiSHKfTwahc0B+HRNs2zEnoNhGjIATb372
         QHH2pyZpXjBbCHf4pNSycRH4i88dkY+0BLxATEYoLX28AGRuXPo1CqnM1ZWy/6AYkQ8E
         cZbe4v+H+2pGOw4vnDX8CcmO7n5aHqj80XKYtn9YnY3jKu7icCvB2ncl8/yJutWW2rG6
         YDBw==
X-Forwarded-Encrypted: i=1; AJvYcCV2IXPoOfspbVmLDUYDLstMF5RTjpV24DtHNLaMr6kDB8cE7bHfWQ1uUqz0oaVzHZoDtwjEgw7xbD8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUOqDsr9lV6ie3nEpKHmb2JYLwT7O8iNbmW1NYzmMlW4JrD6vE
	qFjlaL98h5JGUQ/Fc7hniANWqH92DIn7bjiUDpz8MH7nZodAUaWDnW2yiWNziHJhT5KYaCgRT2M
	BQSUbRyzUTLFxcHSbzysRQmnW9pKYeKOdisoddd102lFNoVqg9c5F2T0kdQnxnQ==
X-Gm-Gg: AY/fxX4koaY4xC987T6A4qkCaId6oOaDJsyTrsLK7/82qHtNFbDdv2zRWeCxmfNM7AU
	HeV6af+OzPCbhIVc0FE+pWBb+Xj1bHifIzMBNJ5eXjbtSPculXY3oL+ECXrHMYfBrxHqEwBo7EQ
	Ct/ZFEgIpQuoabVUPP4QytzfoqiqYqtXs3QcXx08BqaytG7m+JI4+zSEhll9xS53fzXrw4X2kGM
	X03UBUrlA07uJiK0Zhh9fntDyAWFHfhbSJYUCLcjMhSpo7Y+1JcO7U2ewDyVCNKHYMTqwgfwv/T
	tcDBB/io77oHqIzhBGMF0zl2ZDZEmG/zOE4lNNBfAKOt0gHdAu3jr31OrkyMOlZNROUbFvuTfHD
	HrDZGW3ZOidcZy9jpLpX6rnVyx7rtyMInIea9ddHfJAma
X-Received: by 2002:a05:622a:58e:b0:4ee:43b0:b053 with SMTP id d75a77b69052e-502a1ddba73mr16020131cf.9.1768526591387;
        Thu, 15 Jan 2026 17:23:11 -0800 (PST)
X-Received: by 2002:a05:622a:58e:b0:4ee:43b0:b053 with SMTP id d75a77b69052e-502a1ddba73mr16019991cf.9.1768526591065;
        Thu, 15 Jan 2026 17:23:11 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1ed2844sm9167641cf.18.2026.01.15.17.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:23:10 -0800 (PST)
Date: Thu, 15 Jan 2026 20:23:09 -0500
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: Add missing log message terminators
Message-ID: <aWmS_bBzZO2FjIb5@redhat.com>
References: <cd0b3624066b80ed0bb00d489c99e2c1a06d755f.1768480559.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd0b3624066b80ed0bb00d489c99e2c1a06d755f.1768480559.git.geert+renesas@glider.be>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Jan 15, 2026 at 01:36:56PM +0100, Geert Uytterhoeven wrote:
> Complete printed messages should be terminated by newline characters.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

