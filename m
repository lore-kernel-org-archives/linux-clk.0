Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32F31632C8
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 07:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768547721; cv=none; b=Tj0wbzQCfYrbCSaclevAUIjucduStyhZ4tx2EVbpeqEfxeolKB6NtNF1maRLWJ6WgOndjA/E5SOAOZjUoaO2N03RJN+zkDxZjiBPBgdXYDy0we/NE3qoQVR4QJvuj7drRSAOcTLPIN6JFUtcMfgNosMCr61Sipb4ZYhFr3ZIMM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768547721; c=relaxed/simple;
	bh=WOkNGd/6bhym7+utziG3ODS8msK2tF2yxZ4+2JhBkpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iz5ErzDojH2VH2uO1rxST7XJ9JPBGyxbbB3qvzN2yFww/J9w4lK/U5FABz4ODJZdJ+gK9Z41cKGZkfHjQgXHsc68hLa5CfYWTXQvp42Pc1F6Sv1LTJ9D4cVqShYKjYJCGT3W9T8iQJm3FGv7KVe5UDJz/EEw2fqKWTeKmaUJdmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bNk/LHLJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bNk/LHLJ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso7537915e9.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 23:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768547718; x=1769152518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g5QCORoMbkphC/1jrtqJnWhwyxakPAQDBnkju4ETcU4=;
        b=bNk/LHLJpgvJTIhAEAHQH9CeQ51uBIvhdrm11UiuXO2WCY0fihEY76Fa5bNBhkq3M8
         G4QhaVQevhohIbWho2ZkX0HqMLr5l43ICMWbzjseg4ws/FrtDKUc+/aWA5Cw4o8dwN9/
         Ib8rQctdX/vF7E2SE+4buJ9oCKw6Rh6tbDLcnCo0kJaZNTtZwZaFuPm/rPyWQXigRcqC
         PP0MnB8/N//dFHi82v6j04pbCmGSH0j9lFVqwnkpMoQtRPfUpQ2S9qCK04E7x59y02Tx
         R8iRiWrLsBs8T9OA0qCeMwig1ixtE7ye4dKUGyWLmS+n060PXhYDPuE4Bljd1cKSKFj5
         VQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768547718; x=1769152518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5QCORoMbkphC/1jrtqJnWhwyxakPAQDBnkju4ETcU4=;
        b=nchRGRphiEaxPIx5/e1E/Gx5KXGdtDC8HX9oNbqrzBgyGv7I26WDKaKIJgxNsYPodd
         D0a5Oo6Vmbww1Tz2UrhOS+esySSAx+jXaNGmMRL6IuNS7Ba0s4/bBlk53BXfyjPBzjyw
         Afjl3wv+5DnvQLJdA70vMMe4RJU3uQTiPs7ScztJt9dtDJZnEFTMVy4yF64zF4qmd/r1
         8e/h2QbEJxPu66sDvD5UFrGhiMgkTEGvPSbJvPPXU3JKvAN5Avm3CMELRGtCh2FL5yWD
         DT+cjU+c7rE6i32lFjcvMKLrnQoVB2nqbk1D0oZsDSDOMmI3NgRWLDvv8spyIajZxS1d
         Otwg==
X-Forwarded-Encrypted: i=1; AJvYcCU+aryYV9HBnjEULXYuFcUfVonTtpVyd0SgOoHrDWqF794YXWvtA3gfkVD+I4RCRVWBgfWjwCwm6e4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXosJml0v5Wturdvj26TIgEXqw6r3t8g76sOQ89TdAfRse1R/N
	fg+gwT1lc9tR/Xh7j7nnoeJHOd9PATj+LEIBKrSIpQWlKGFFYf5k3KGQdkeYqj2e2do=
X-Gm-Gg: AY/fxX7aeVJozTYTzJdOPvevIsCtBimHgJhGw9CI7jmJMnPZX0pyy6q8fJirKQJxDoF
	1dwciIj/6XbSsJ/wX/YQIOVJ48qXAflYLCrh/7xqQPMH194Kdf1OrmHKyuYL1VPEY82SzkML7YV
	r/44P2MWdmzfb5vw1PwzTHEgKcszPfC1cLoDN1F51aLa9uwu8ny52zb8DDFxwQ9Y8YboPlZZt/G
	XtnYRc9FakREqyEtVePDMLLznJlxnSw+nhhvsuhTL185pT64/tOJtBcgZ4K3vT7h8rOc7j++IfC
	PpizGErLhTU4JtzVjAGNMREVGkplS0sDkorXlh1/oT4NKCrU55/Ma82fz1JZg/pP5DswYpOleKQ
	rOT660m7Ou5sy4pWc7ETbG0HRIGXlVcyM2/8dhQSjweemw0QlhPNz+6ii8CIty+zgzWBILT1Pun
	tSPgSXYGLtHVb4DyUvPw==
X-Received: by 2002:a05:6000:220d:b0:42f:b9c6:c89d with SMTP id ffacd0b85a97d-43569bcc1b9mr2254668f8f.52.1768547718155;
        Thu, 15 Jan 2026 23:15:18 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356992681esm3418486f8f.11.2026.01.15.23.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 23:15:17 -0800 (PST)
Message-ID: <bcaa0b6c-48e7-4407-b399-cb5b998dcfa3@tuxon.dev>
Date: Fri, 16 Jan 2026 09:15:16 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] clk: microchip: core: update include to use
 pic32.h from platform_data
To: Brian Masney <bmasney@redhat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-clk@vger.kernel.org
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
 <20260112-mips-pic32-header-move-v2-7-927d516b1ff9@redhat.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260112-mips-pic32-header-move-v2-7-927d516b1ff9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/13/26 00:48, Brian Masney wrote:
> Use the linux/platform_data/pic32.h include instead of
> asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
> is in preparation for allowing some drivers to be compiled on other
> architectures with COMPILE_TEST enabled.
> 
> Signed-off-by: Brian Masney<bmasney@redhat.com>

Acked-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
