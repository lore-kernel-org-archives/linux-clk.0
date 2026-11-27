Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792670;
	b=UrsqjGzYKj30zZlUHAA8EKmps+5V6GA2CSSQfce/TCLHyVNMswsOWNlkfGk02OuB694G
	 qKKnslbPYa1gpYCKU5HtbRsavDVTs8/xxx21ULTvwtAN45XaFB7Hr/+JWwr+xTSLJh7wB
	 1cxfWh/bD7rpWrpqybIrj419TnPhA8etrYVaszYr0mffpSMagoBd43ZlsrpLsY6/MoMR6
	 Jq/yDv+tju83YW8yBycxpI4mL9EfKxuQRInNRRw2ITq6M2QDEvoiGOr/WVLhttSGRRLnb
	 ndQorU7PeIwQmN/+MIYOlRME/5Yr8UXJFoGnepG61iubKWH0QeI8CAs5P30+zQ9rDeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=d9py8oPfvfLRmuFbfYsLe+2KtIS5cNH01MMiHS00tcM=;
	b=254pMeBu1lJ92xagS0I5NTzaW1MjNfuVXxvI7bnuMyReo4vXJvf9CmoQ7S5PFY1O+IPu
	 XClcre3QBHKO/GQbpi+zv+uI5BSkCVt5JdOfN/BEU6EwLzQdiaVzMJ3eWiLG0Ri6XxMFv
	 cV63Wd//VgHC+ohIAnJmgU/EybYDXaZZTQ1vXNq6DZTXbkwhdpjQ5ad26e00UzLARgmdP
	 9mTsCKddAStflEwuVCLXPLsTW6/XieSXzL6xUo2SjLAD27l7G23H+dMs99K1SS+ol0rmb
	 Ky3GEAYZzokJ1ReIAjfNWI57F6a5qpRlXW2/QUU5CsEYmVPOnee0I2uR/iPEkbCELnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CqHyoLTv;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B178D606A329
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 15:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B178D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CqHyoLTv
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6bb06dc1fffso5928745a12.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 07:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795792668; x=1796397468; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d9py8oPfvfLRmuFbfYsLe+2KtIS5cNH01MMiHS00tcM=;
        b=CqHyoLTvOKND7NqUor3O8BtLLEwmJexce1Y1TE5HiAn9JEy9DGO/hrGTADzvlIWQ9g
         YjVZs51SMkiCZPf4M6QkxrpBstzbUh8XHOkuYmEirdAbJyc2ZV5gyHjJtEwOHITGsCGY
         t5+PFWXkazQXbc2ojqwuubEJJsJnm39UZfaYa4zmrAOWbiM9ObULIiJjYsJVpzCFdw3s
         Xhz8oxrFrg8K8yu04MtluUViiVcJ+ZUk366XXZ7AqB5r1iXhoaGPTLoxT/pmb42h1nyg
         bEDIHw6JCaw16MjLVHrgovVoIYXMfUw46Ab2THDg8ydTndpX6H/ZtEdLy5KWJQCRZmZu
         J2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795792668; x=1796397468;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9py8oPfvfLRmuFbfYsLe+2KtIS5cNH01MMiHS00tcM=;
        b=fo74etSFNMdu1DHVFVjtrujImyqGjaV4NhYn4ejAOje9yf3ieGmqb9PpqDaRxw1ZSq
         4cZpZpD/66mz1e8tcGymbNNZuw0YNnfKp6xhfm3m9D72orLeuwSUsH6Uc7zClUhLZI0V
         KdWlEyAzHyqyYccxJylRXXQWqZ3/JcMljqhKUdAX8nPk8KwFeCa66xG3O/uOxHjNHvUz
         VyymGmTCv237O8ko1kKqEh49w8piad0TwuukZUgqyst5/yrdXNv5KxpG5bihrHehE/bY
         1/Y/5jp1X/jRlUqxflZgZowMpTkFOeefi/WdAoRlvpZ4ZsI27UYqdWqK0nYGkMo7TpZX
         nRqw==
X-Forwarded-Encrypted: i=1; AL+hErFaYi42E6vg6OAtWQolVoSCBIAFiMMSwY3yomUPyodpiNdvveXAKZ6Ich8ni56cGJy2AzA3Y/H+4wY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b+VskYvYIWKcCVIcDYejSLxBSsU4YsQC4USkfbxHIpjUCz19Z
	qFIIwuaT0EJKw7zr+9hr1f9cpMVhko2vs7c3sTrwCsdIDD+taq2Iz9FDSIeSXmgtH/jVfyrujyY
	7WtLs
X-Gm-Gg: AZFdTZcWLF7t6f1HMcAld+GnI+VNbiaZlgdBJ8PFFdjGCabxlxN0xQepAiagXKHPCUZ
	s0MO2VRuD6eFvRSF0W2Rbph7RPB/bu8+4tZxARwFSQ3ZXNOZWq1olTZEeVXb23EsWW7Np0c6QFz
	p154S21pdQcGJnrO20LN6Q4AXhi1CdxK+APmCcFI+YluKM1Wte0L6//13IUuofsKntS03wYdIqZ
	xr88U/J90yRb+9nX968oiUdHxFUAI0unQMenN7s8X4iiEzJZ9brefkSXExfNYo7b27FXhwvZzkC
	NPOoShXyPh+DZpbGSddGmQep6Ft8MlshDl0I5nl4yBBgbpfX2H1Eq6QEG8w4CCqBoQ0DaDj/awx
	/m762ckZmcZx6A/eqmX7qVIeZp32rv0CFZyHiWeM6hQW3ORnKb2QkRXG0hv5yZ4/TVDRLOd1ONq
	9LbCHsN45vZY17DDo2e13yAds6SCHs1pfHaJJXGz6Yd2SmMkQLKSM867CrLcFOgGO6FraAsohFy
	B8zE4Z4KKWye+QQ981YIhRPNF/yQHsJx6v9lxDuexpVctYE3NodAFKnSElOfhWmUtefR8l2Mpev
	I9V6TKefER4cn7CA5a8yh33JCs9hQHZdhBknlhqD45GipSSa
X-Received: by 2002:a17:907:6eaa:b0:c46:d837:b358 with SMTP id a640c23a62f3a-c513a4355afmr2170185666b.3.1795792668210;
        Fri, 27 Nov 2026 07:17:48 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513a8678cdsm859922066b.0.2026.11.27.07.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:17:47 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 3/6] clk: starfive: jh71x0: Add generic CRG probe
 helper
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261123112053.20400-4-changhuang.liang@starfivetech.com>
References: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
 <20261123112053.20400-4-changhuang.liang@starfivetech.com>
Date: Fri, 27 Nov 2026 16:17:40 +0100
Message-Id: <179579266081.2809466.3640091940793174076.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Auzs4ujqrLqv73w/LdDQcDLJr4HOPar7zURfN6DCgsE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmc8yXzf/RN2tJSERXL7DKNlb0oVm2pprj+/tmXGLan5
 F97vIe5o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABO5tpPhf7jYzTTPhobs9dU5
 Es+ad+yIzL/j1BRxOay13sIn8031PEaGOQnv+/Ii/HRy/gl69Tkl+l6+qnVm5ZTQLNX4pS9NPjL
 wAAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The StarFive JHB100 SoC has several clock and reset generators (CRGs)
> which share the same probe flow: map the registers, register all the
> clocks described by a table, add the clock provider and register the
> auxiliary reset device.
> 
> Add jh71x0_crg_probe() together with struct jh71x0_crg_domain_info so
> that each CRG driver only needs to provide its clock table and reset
> auxiliary device name. The reset auxiliary device is registered with
> jh71x0_reset_controller_register().
> 
> The clock table is made of struct jh71x0_crg_clk_data entries, where
> each parent is described by a struct jh71x0_parent_data: either the
> name of an external clock or the index of another clock of the CRG.
> This way the external clocks need no index of their own, and the number
> of clocks a CRG can provide is not limited by the width of a parent
> index. The existing JH71X0_GATE(), JH71X0__DIV(), ... macros can be
> used to fill the table.
> 
> The JH7100 and JH7110 drivers keep their own probe functions and the
> index based struct jh71x0_clk_data for now.

I trust you'll follow up on this.

-- 
Jerome

