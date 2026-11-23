Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452956;
	b=IplGA0KMrlsV47NgDOl7x94DMAjnyd5hhknGrt5ezqPIbo2rXSiMMFIwWJcMcM9Vzosg
	 eYLaaYqMhA4pqVsA+8hYjjNiGOCbaViLw1nVr1w9hEgaH2ZR6xdZs+9QzynNCMFOH094c
	 gu2nKDmf5txLDYjPqIXahby8VUcRFyIiw7NyNZHhpEFDk/9XBLHIe/l/0ICDmxIgagpSP
	 cFi2R5RMqomu0/5eVhMCpi2CyP34Zi3YfhT8+ZpG4V5MX8g2YtwbczMHs4pmA1woJgGtp
	 naiOunPcKB0lZkjmsewNXjzAlIBdlWnQHV1FkChY/5qBgVURI1uP9cvUqVAm50I8V6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452956;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=JiJWtBiXq1+5RKYEMTg+aa/FLub2kV3/FMeSnrSIRCw=;
	b=sQFpnHkd290Ry1NltGxZWXGZ6JSyTGT2AdRR0boZs/nBAUcl7fCU7qRwyK1HY9BtHSdh
	 VFQKszlP9uJjnXmQGHtNYYgIzoLAwbXavW8o++aoLLtMqV4CfhRLzzdzb3olellZ74jJm
	 mCUrUSnQtBsAvU2ow4yw8bJs9I1mIpAYiA7pVXugMeX+AHsx32TVILDPCUygTe+DLD2wb
	 K0hFDl69jG2Xnq50gTK3B3rC4Sh6Hl65pfhZTYIoxPbxRc7S9H+tmHa5fZwMCTrnOxYr9
	 NhHVu+5oydJvJLe9qP35SwSXE+PIjuQPL75kKAZojl+zC+KF3BTFqwhCWJKzOK/JDqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TDdLjKjl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615E0606A337;
	Mon, 23 Nov 2026 16:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TDdLjKjl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADAC21F000EC;
	Mon, 23 Nov 2026 16:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795452955;
	bh=JiJWtBiXq1+5RKYEMTg+aa/FLub2kV3/FMeSnrSIRCw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=TDdLjKjlFLKf2tWyUFQNB/8I4PmHPudG3ijiqjF1mjYsppIOCwVBJDZqGbyUK0/mn
	 NxlAKUbHFfQBwdT3EaeZ4iRFoFI3oVKv6sRfmiGAlO/m30cjkPXZu6O9skJ7Pft41N
	 mnpxFTmK0wCireiGpp4wnYw6bJcOr+v/Bi5JO4aE4jHIdbfwapfADLKPFNXT9BX6bb
	 eC3IMfp/rIlC9zxGvGxy5mhBJR3KifFffOiT2257LqIx3IKxTUXPOiFP8KAp/NrIu3
	 Mgz9KXlBwuLdtdRwT3REUbDUgVRNRmki1gBZWYM9h7Y/hRdnyRy/WZ/L0ok0CS2wC7
	 B3ssegoNWPoWQ==
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
Subject: Re: [PATCH v5 4/6] clk: cix: Register the Sky1 AUDSS IRQ auxiliary
 device
From: Brian Masney <masneyb@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.murphy@arm.com, 
 sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 tglx@kernel.org, devicetree@vger.kernel.org, 
 cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, joakim.zhang@cixtech.com, radu@rendec.net, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261120053529.371923-5-Jelly.Jia@cixtech.com>
References: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
 <20261120053529.371923-5-Jelly.Jia@cixtech.com>
Date: Mon, 23 Nov 2026 11:55:36 -0500
Message-Id: <179545293652.209212.10772184134283516103.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=650; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=gy5VDOsHr+MXi/hQ1HMI05+dsbHa9lnkZnbNKtej0a4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJZCoTcjj+xfT1hb4vL7j8PFq1V+LAiRDM0onv/jk5B/
 9CKM9YdHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzE8QHDb1amd/xn0p1L3kfX
 z+s2vtLGEaq2yUci63GE9IPbIvUOUQz/M9NOmK/W4pg7y+SYHmNhmkHxzbzpKRevcJw03MrPd8i
 HGQA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

> Register an auxiliary IRQ device for CRU nodes declaring an interrupt
> controller, following the existing reset device pattern. Share a raw-lock
> regmap with the IRQ driver so its hard IRQ callbacks can access the CRU.
> 
> Restore the parent before child IRQ delivery resumes using noirq
> system-sleep ordering. Use the same PM callback macros as the IRQ driver.
> Auxiliary child teardown must run before parent regmap/runtime-PM cleanup.
> The existing reset-sky1-audss.c is unchanged.
> 
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>

Reviewed-by: Brian Masney <masneyb@kernel.org>

-- 
Brian Masney <masneyb@kernel.org>
