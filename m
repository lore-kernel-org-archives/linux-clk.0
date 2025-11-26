Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0A533A6E5;
	Wed, 26 Nov 2025 15:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764172071; cv=none; b=ESYxkkm48Pp9twxIH2iSy9kJoCYkxa4HkqFBCrwCTLQE8mbHwYKgBX4KZswv7rdPCtUrWi0NoxEPSqQY68JbgnHQW/x1Ly71Kkbk+Q6y/rpJw/0z3CQ3JIyIwfw/lDvYvaz2MbBB1VUgYF+ZEm7KGnRGofTw3dt0SW6WKB48AY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764172071; c=relaxed/simple;
	bh=Lb752BiCA/EqAjW2BAoQTm961QUYQ0BrJ9YL9ZNR8Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgsx00DSw+gnkX167Rsn86QGzU5S7HVIGD7oOllfinBGMsaDDglBDRvuygLiFAgru4Hp/3x/IhkNmCiDhuY2eS8hy8ldDuIzzZ1m/fl0wwUzAoA6SLnp5iNC8weTL2oAwH4LN9nrV51ANwxD/wujUUyNITJXREM75/DUeowlAEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJee7PBP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJee7PBP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8D2C4CEF8;
	Wed, 26 Nov 2025 15:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764172070;
	bh=Lb752BiCA/EqAjW2BAoQTm961QUYQ0BrJ9YL9ZNR8Mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CJee7PBP36gfGimlAHsY6NQW2RlbUzjd4oQ/pOnUNu78WzRVkW75bZK+EEhoCp2cM
	 SJ1i6EI4+LJZeqcJXcOb3hfZAEjBP6q7jtEcSgvDExB0xnf8B1SjvymuAcpZaF/ksX
	 GM88PgxyCfkAl24G/O9MUSuQkP+ZYTKwLCgpslW4lRK3KJF04UlkXqNKGFDL9oS6IM
	 p7Lu6Ck/lJ/lCu/eBHsOgUmJ5Wxl4NHsHi6MDIvU7UkFlRoTu6NK9LaWQ/OoOuPZBT
	 Xwli7k8T3Olrf/HEQnOvipuKEE4tQri7rcMOKu/YwYnaZ0QDWN/ZWKweyP1TvSBchA
	 i2+cvLnrckLYg==
Date: Wed, 26 Nov 2025 09:47:44 -0600
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH 5/7] clk: thead: th1520-ap: Add macro to define
 multiplexers with flags
Message-ID: <aSchIJ7hp1hBuahM@gen8>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-6-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120131416.26236-6-ziyao@disroot.org>

On Thu, Nov 20, 2025 at 01:14:14PM +0000, Yao Zi wrote:
> The new macro, TH_CCU_MUX_FLAGS, extends TH_CCU_MUX macro by adding two
> parameters to specify clock flags and multiplexer flags.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Drew Fustini <fustini@kernel.org>
