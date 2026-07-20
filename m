Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0D73B42EA
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 20:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784577744; cv=none; b=XdY2QBKkHSs8pI0c9IaZ5nBuaJB/1hchwno2lEoE2HKhwiU+lSwjSB954yedzA5jNco+5wrBbclE0OyLPd8RQEza3UScVjBwkz6rDq/jLkDHDCRXxIWKyT7nRaZd2AHvni422kSH4iLsX16isp5VA7kO1QWBpI7EPLEv72x/2SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784577744; c=relaxed/simple;
	bh=dONdkvuIwys24Z+B6OeIAkVOC3faQ+xLgHXqKChycmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXuw8AjpX/kYzenwSIgwOqFdGyZznU5NJD6AOipO3LCLwUlHniVF3Lu1Zbrbq4ua+PHgptHaX/vpNWPc3Om/MU+1SzpN2fmUqDyNxJIrOm0LxnhfwTZXS7Q1lwwkMcjICxQoIh6eUIE/+Z951ISOarI0BC+gCjdJb5hMJ2qpHYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SEB/gDD0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jVIRcgzS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SEB/gDD0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jVIRcgzS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784577739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wv9fvaxLH49NpPefXP+gfDcvYRMVVGve36jTQRR2YNo=;
	b=SEB/gDD0YzK9x/W22R4dYL5KY94zygrmLvnCUmfdTtYjCBh5hOYiCLjbBgw+a2Xr4Y8lkZ
	72CBzLosy7tx+fU6YV+OgOeWyupsVuCF64nLydtA+TGlbtSsnN/J6CZK2TlqedXyp4r6DI
	aUYp+sr9CsXfEacLb29fd7RBbBtmN3Q=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-MW8ExcHXN1mrVP4ntYP0VA-1; Mon, 20 Jul 2026 16:01:58 -0400
X-MC-Unique: MW8ExcHXN1mrVP4ntYP0VA-1
X-Mimecast-MFC-AGG-ID: MW8ExcHXN1mrVP4ntYP0VA_1784577714
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c083f1818so136171461cf.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 13:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784577714; x=1785182514; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Wv9fvaxLH49NpPefXP+gfDcvYRMVVGve36jTQRR2YNo=;
        b=jVIRcgzSkwgSUtG7rdOEi6PZxJBQm55IBqRLcHF/dsIY6360zB3G4UlPBVwCBtsBUK
         Ih1hOYA6Wo2XDGr5Lba3JoT7M1cVc7x2Gdb20tz5Q0A/mbJt+wttWQmn8nWV4j0x1pqn
         YLkiwzw5ZTdK9Ss8jNMmf/quqCY7OZlRmAjzfhYNONgdeD52UpPu0mu9KnwzjX9cONPi
         q8HZoarOo/xj9qIXvUrIO5sRM7BemC8KUNArKPpU4yY19yXZwtCnAm07QbTAVDXTs8ht
         bh86wfulRWXde+HGHH8wfB/BgM0dcxQoAwn5jTTT65sN08O8xgU4KisznrqH8PI+3npH
         nX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784577714; x=1785182514;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wv9fvaxLH49NpPefXP+gfDcvYRMVVGve36jTQRR2YNo=;
        b=UFRQO6BMf6tHxNHYmdzjxmR06WcWq5UyxwYc9kQv66FA+eRwvN/F55K9r5u+CIhl56
         YpDZw5TXr3jYQUoVqO+f2lpSS34vmbWSICXr8xz5QHlqeU9+CuNui0dlWcEUlLoouKuG
         5LqTTw+w/QyIAk2TZO18PL+ZqXXiBBzP1aKK+er59o3Pv6Ij3jdcuWx2S7ldI9nh4TR/
         w3G2jkB34vjVeGz4n//jsQozSXM6qTH4Zl1lZxopb2aMPDVImwit01URNgfTGdR2g8Rk
         Ro5BJSd9LVSJtBqRGig0xKiGHF/pdxkB/KTW7+VoJX8OcIyYcaouj4VOPJ4KcC6xqbNS
         C2Nw==
X-Gm-Message-State: AOJu0Yw7/kjb1excHympP06OPPkTg+y8+v7TAewApZyqiUFCETT5T4tH
	xeFYsTna/4bSeXd1gQlMgZrl1OK8uh+WnDYXVu/p4UbBNcxbYbBjJN/Gv7DXt/PcpYW444GziND
	gAEkEGqy+Qcvom3juAZWybwi01OCsGGTE070IDxmDon1MToZJM4WCXRm0Op0Cpg==
X-Gm-Gg: AfdE7ck+gDkvp2IzmuFcTKTaRQQVDlJwaq+jh4rTaIr0ljeTbLDDxWuJ5q3L5mFPkpm
	ZTNa978PK+5/Gda2TzI9n9J7NFHO9Sb/8QE7xnV4mlABD3zJdnaE+G8fQHL8V9jOkP5wNnwAsjB
	r6j11e9BCza7GRhLgnwXCFXAj8uGCTlaAzxPDhh2Zj2BklTYH2bfuhmzmzh7p7w4dfq3T6bqjA9
	zWL52E7s7MY158SDhZMhyPnVLM6kJd7Ml7E+LaVJ8RQww6dUMCKQXBWUkkbSjzILNJWsqJxAqCT
	D/CbDWPLXWeUAi6kUEl7FkBeEeuutO7XopPACwZfNZe+xHMt2/KGggwdUU2bkLMrcZ3Exh7l+uH
	BwGQ044I8mIy3QAeFuzwQAbPC9O6RKMJV4Hg=
X-Received: by 2002:ac8:5f93:0:b0:51b:f36d:1ae4 with SMTP id d75a77b69052e-5213cad91d7mr153345011cf.43.1784577713778;
        Mon, 20 Jul 2026 13:01:53 -0700 (PDT)
X-Received: by 2002:ac8:5f93:0:b0:51b:f36d:1ae4 with SMTP id d75a77b69052e-5213cad91d7mr153344631cf.43.1784577713349;
        Mon, 20 Jul 2026 13:01:53 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214d095ed4sm79193511cf.10.2026.07.20.13.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:01:52 -0700 (PDT)
Date: Mon, 20 Jul 2026 16:01:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCHv2 2/2] clk: stm32: allow STM32MP COMPILE_TEST builds
Message-ID: <al5-rbTqpaZ8EeHf@redhat.com>
References: <20260719215040.767232-1-rosenp@gmail.com>
 <20260719215040.767232-3-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719215040.767232-3-rosenp@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sun, Jul 19, 2026 at 02:50:40PM -0700, Rosen Penev wrote:
> COMMON_CLK_STM32MP already allows COMPILE_TEST, but the parent clock
> Makefile only descends into drivers/clk/stm32 for ARCH_STM32.  Use the
> STM32MP clock symbol for that directory gate instead.
> 
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/clk/stm32/
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

