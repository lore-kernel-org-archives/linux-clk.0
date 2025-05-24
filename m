Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B65717BA3
	for <linux-clk@vger.kernel.org>; Sat, 24 May 2025 01:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748049957; cv=none; b=UFYKYn5n2GJ0WbnJ5weRuTfRQhUBzldRyantphliM8HGg4xLRDWoFdy8o0OrYeoX9YNc7RT92s2FDQqwTrxzODixLYWXdB0chCRXXHL+/Zs0dCCQtEAGsQiZQuL1+BofUYrqSZXLRRCtFm36DdVfUnNVFLzlpoyAxivFsHwM8RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748049957; c=relaxed/simple;
	bh=l1ZDZS/SgRZKCVPpw+35tAdRnJSUkZtdbbKhB270Ijw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUXPu9Mfq+lPqPYwwxWpTmsFLZJc2ldBmur4zpIYRAiihM7MboxMzf5AqIT4kVrThqyCZzqwoyxsnwSb3jK3RoqKrZzoZ7R3E3+98tXhyHvIUCa01HVZEANRWrFnCFklwwsGN01fVyR5IAJjEHnRA81nLtbPBe3GEluQK81An9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=zNoI9kDz; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="zNoI9kDz"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74019695377so340204b3a.3
        for <linux-clk@vger.kernel.org>; Fri, 23 May 2025 18:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1748049955; x=1748654755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gsJDbHj9dierw4BMguGhVwoJuBKXsLDgRKWknpTgP/w=;
        b=zNoI9kDz9zZj0CWQUwjYqIo8oyli45+NrwFolMv8e44TFIzdWQsWPrvtWRFvflHLOC
         IPMIRkAqZpw9iF0yCPeH3YifjnyKCTFVNwBDMS4vEDl+H2wqhl5zPn1Eeko0Ot+pPW7X
         Gnz8PB4HEq46BxVoID3khIgmA4+VNpiuhCQTl3Xtd6jBrHxAh/DUvOLQ8OzstcACj8/X
         hafRu7bHY+lPFOH9wNGCMVrbmY9IsLOcuWHYwmsCZJsqOqTTnPvNX/QZ3Nq/qqZH1dl5
         b513lwx3IAAVg+F0hrGm3zUfTSzX3RJvVhmN2LkDUE+j5vxGmjzmZO92+GeA3SpSQMtg
         q65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748049955; x=1748654755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsJDbHj9dierw4BMguGhVwoJuBKXsLDgRKWknpTgP/w=;
        b=ZVSWmQLBIsKncSjxptqzSz+g652mhbhh64FoQHH1MfqGJqA5KwjcWlMFTZ0pldI66E
         94j8hnV/hyB5b/ja/0+yYOJVQUR0JmenLjj1xe/5YeWEApaUZa1+d/xB8jgllga8r7Mn
         YUDVW7SbceVC6KBQTsK5BbHVAIDp6nj2kVL2z+zU/C4pP5MA8omQpScNiPtnyqfhDPKT
         69IsoOG7JbXO98QpkgjWtWi7SfDXmQ6YbB2jnulXoNFXCMD5q5X7y4DyDyuVrqkoPRJH
         87SLb0/Wf8sxMtJhujgwAWviyOeLaFR2mSwk1QJVGn5nEujILAnSrECYE7AnBvpy77WM
         KZmw==
X-Forwarded-Encrypted: i=1; AJvYcCWjXxw/+A+/jkwq0KpgSSLfASm6ic+MN1ms6/buVjgaxowLE+CVRwULu1fa7pMQDLVSL1muKWpr5FQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyEtju4Sf1DX4TncvHeBy2f1G8oxmVOnJOqM/r1v5gqQBtMdF5
	oli2pQTZ5r/ClDdzhqPJ2ObMuoNtfkT3sAMOcbH0H4Toredyd/gR3aoSFtbUSBvQGRY=
X-Gm-Gg: ASbGncs0ZWGvxLnsXUf/aG+lv15lo1+KQCQJZ1Zr05IA0Y3eI13kyUsYr36kdE95Boa
	6v+TMR171Lf8TENygnbQ58zOjgKCu+WqyIRpfkf73WfGh2XL/ZE2TcIItp9hActxUoHwTWkHBi1
	di5mHIFuYcKPE1CzqqdIyWxXNoALZ84bCRxxNSQD5cvQJmrHaFdKcurqIdWxUUrt4gXbXftR9I0
	ASTVBvqoRuEmwRU+326choMp98h4/2SbQe+1iKiLCotKeWDSPbDi0j7Sx4KWZje7fXmw7YdrQKR
	+O1UuGYEaBsOr3sAMwB2Okoluatr7mzHwBNN4QVDz2dfn8hq7Oqkfso1cxETLs0=
X-Google-Smtp-Source: AGHT+IEOGeOW+PhuQhUWHpeQcMcmiGpwG3vk6rjPFlkV6C76xF/ii0bBJjaE1/tPG81FTngDhnjmmA==
X-Received: by 2002:a05:6a21:1089:b0:216:6060:971d with SMTP id adf61e73a8af0-2188c3b49bemr2223604637.37.1748049955462;
        Fri, 23 May 2025 18:25:55 -0700 (PDT)
Received: from x1 (97-120-251-212.ptld.qwest.net. [97.120.251.212])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2c208eeeeasm195364a12.13.2025.05.23.18.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 18:25:55 -0700 (PDT)
Date: Fri, 23 May 2025 18:25:53 -0700
From: Drew Fustini <drew@pdp7.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [GIT PULL] clk: thead: Updates for v6.16
Message-ID: <aDEgIfYl2f7zcO3O@x1>
References: <aBus+Yc7kf/H2HE5@x1>
 <018214f410632eb3dc6c6bd6ab58cba1@kernel.org>
 <aC+mJ560HbscG38R@x1>
 <655ea20d-ed2a-4727-b7c1-65fd69d3c027@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <655ea20d-ed2a-4727-b7c1-65fd69d3c027@kernel.org>

On Fri, May 23, 2025 at 08:25:38AM +0200, Krzysztof Kozlowski wrote:
> On 23/05/2025 00:33, Drew Fustini wrote:
> > On Thu, May 22, 2025 at 03:24:02PM -0700, Stephen Boyd wrote:
> >> Quoting Drew Fustini (2025-05-07 11:56:57)
> >>> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> >>>
> >>>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>   git@github.com:pdp7/linux.git tags/thead-clk-for-v6.16
> >>
> >> I changed this to https://github.com/pdp7/linux.git but please fix it
> >> next time.
> > 
> > Sorry about that. I'll use https in the future.
> This should be kernel.org. I remember Drew we meet few times and you
> never asked for signing your key. Just get in touch next time on a
> conference to get it signed (and bring printed fingerprints).

Good idea. I would like to get kernel.org setup. The Portland kernel
meetup is next week so hopefully I can get some signatures. And I would
definitely appreciate your signature at the next conference we are both
at - maybe ELC Europe?

Thanks,
Drew
