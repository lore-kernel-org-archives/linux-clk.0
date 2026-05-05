Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E457317170;
	Tue,  5 May 2026 14:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777991444; cv=none; b=BPmU+PKrtnvH86QNCq4C3rwnZ8Oe9U4c9dWdmyOsDJkm8r3yxh4ApaGL8t4wNqU4IPuBDp0X5DLXJ6zMS+yNYfGlJ/fSl1dSh4WnSSVdg1ONTQ4TfDwLPL9j3zcLYeZXAyaqBBY61HJhNwm/Uh6cDfSrUeMs6wCZR1WDJXMaXSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777991444; c=relaxed/simple;
	bh=6g57ADSan+Fc6cnQH7IOItTT3HRVSqQYg1nFqrNd6Ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CmJ1iMadMFkfSwhKuWdJayO2ilzSC2e6Y6LWMGtpefzp2BM3HvpOfbSdQ8xJc8aHZ0gSSdIT96cVg7NPRTOppR0gQcfHU0OKKcAmFYdRBpfn3WkkjiR0muEgTCsg/aityrlHX+iUcQWC1Pj60NEzc8jNaDhn3T9yIEhJnMVlkR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTrov4d0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTrov4d0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78558C2BCB4;
	Tue,  5 May 2026 14:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777991444;
	bh=6g57ADSan+Fc6cnQH7IOItTT3HRVSqQYg1nFqrNd6Ag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TTrov4d0+qASme6DoHhRWF6XhwAxTOjhYkXLzRMygGO4+pG/8fIzZmXV+uc02A4lT
	 fjBnLx1r0Ic97G62UqRyvHWE8vbi69BmDBicQXmlEPSZdrqpxRP4oFR2miH2H8DMyX
	 O9Kxrf/vIs+szSnAgh3IidnWruR0hgoJU5kJa87WMvrZvt1aY5eah6tJ8zY4J0yK6R
	 GR74u5azKdZSkHkQWurkxkec08x1kLgeKhQlK7EiIjd09kl6QLy0974pIh/fkjwcTT
	 SDBQL9p3YJnnPR/2oWHgMyqyAa4tUv+TAv0RIMoaC6X3ws7+FDJoZKWKy2jWnQzpaU
	 G9+xpz7w1XilQ==
From: Conor Dooley <conor@kernel.org>
To: linux-clk@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org,
	Waldemar Brodkorb <wbx@openadk.org>
Subject: Re: [PATCH] clk: microchip: rename clk-core to clk-pic32
Date: Tue,  5 May 2026 15:30:31 +0100
Message-ID: <20260505-imaging-thickness-3b3a8795c870@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225-puzzle-cargo-9d23eedf7957@spud>
References: <20260225-puzzle-cargo-9d23eedf7957@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=818; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=0rA5uJT064PpTqbpeXU2gboizoqpqECKwUTUGSMo/Ek=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJk//7O3/Lz2db9rodjX05+4nDjMfi27yxx3UXnDtZVfG tNvtn1N6yhlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEzkxgZPjPHbtqxVXFmBdv 9IQ77jNnSRhbBj99fenI1JhNZZ3i85Yy/DNy9+kLfbKyWD8q/ezmPzuPnuyd+SihYcWvGw7Kv53 eybICAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Wed, 25 Feb 2026 17:44:52 +0000, Conor Dooley wrote:
> clk-core is a confusingly generic name, since it is only used by a
> single platform and it uses very similar naming to the "soft" IP cores
> for use in FPGA fabric (CoreClock or similar is what that would be
> called, although nothing like that exists right now) that the FPGA
> business unit produces. Rename it to clk-pic32, matching the prefix
> used by most functions in the driver. As far as I can tell, impact
> on whatever users may (or may not...) exist for the platform is minimal
> as it's built-in only and the functions are called directly from
> clk-pic32mzda.c
> 
> [...]

Applied to clk-microchip, thanks!

[1/1] clk: microchip: rename clk-core to clk-pic32
      https://git.kernel.org/conor/c/b82e98bf02ca

Thanks,
Conor.
