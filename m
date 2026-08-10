Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7274398E0;
	Mon, 10 Aug 2026 18:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387571; cv=none; b=k0tXgI2Qi3mPwtbUG2xUmddJ0gzh8+M2qppgWSJQQgQtdWkcoDWYe4FqWzZLewCtWjuKkDleik6fsmxWrf+xbM1iiszcnsdnC4qwT4NKoFtoox24Ksl1v/CXJTsSMDHEkTWFrw0H9wTwdbu7BrXiDXrjqiJ2kLwBLA9ZOqM9a9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387571; c=relaxed/simple;
	bh=m70IAlpke0Jgx0QboMarG9CRcuoVRJeyEqFmPTr0B6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mwu3EZfzJ2ELNBRUlMRxtD7q1LxJhUVwhhSxSKrniyKCdeURZlaGd8Rp61g9q15yUpq7L/XtCA20zMdTFayoAb7tAvCCYjDorYFWqZMZ1PsKkAHTm9jIS6zeQ0bzm5GDSgpl8ZQwFwCyzvkmoBN/CWnEcQuppQsxqaCRRytlg+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBFmaO4O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBFmaO4O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8171F00A3F;
	Mon, 10 Aug 2026 18:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387569;
	bh=WFqxySnYvpiot/1T8W6/v7Q0KB5blhTw02nBKJtflvg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EBFmaO4OPh60+0r2JoF7V43cA6wvySoFHZO5NIP2jGqGig3aF4pqXE/mamExgin4M
	 Nb8ok0fJdGMadZO9thUuEVVcRw1PdeEjjTY0J4Bv2mCpV6/tMTy8F0tmZT7FLPlQV7
	 1F3O5cmiUlb0CqqKTB+FHaa05v8V7I1HZHEv88nZ+xOUZvtZiZ/pMWJj82Z9qh2W0N
	 KLhpDjJupgEmBOwvmUJkV5jWA/X0CwYj+iGaTnWB66iGuymDN+37EyW0aHDp8Gms5u
	 F0jj8DiE68j/SO/o2UIDMwnSPXB2GA83QDWpwqhX10ckClCj91plObTYS7IY7JKPtB
	 i4ephuf/HhiUA==
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Cc: Erikas Bitovtas <xerikasxx@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: (subset) [PATCH v10 0/4] media: qcom: venus: add MSM8939 support
Date: Mon, 10 Aug 2026 13:45:55 -0500
Message-ID: <178638756045.656675.3286329293875125953.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731-msm8939-venus-rfc-v10-0-9ac503250fc7@apitzsch.eu>
References: <20260731-msm8939-venus-rfc-v10-0-9ac503250fc7@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 31 Jul 2026 22:08:19 +0200, André Apitzsch wrote:
> This patch series adds support for Venus on MSM8939. It is mostly
> similar to MSM8916 Venus, except it needs two additional cores to be
> powered on before it can start decoding.
> 
> As per Dmitry's request, I am attaching Fluster results and
> v4l2-compliance output. Fluster results were very inconsistent and
> caused power collapse fails.
> H.264: https://pastebin.com/C15qeq5W
> H.265 (HEVC): https://pastebin.com/WDsnxvuk
> VP8: https://pastebin.com/egAgEm15
> v4l2-compliance: https://pastebin.com/VpBhEFc1
> Power collapse fail log: https://pastebin.com/rTivMcpK
> 
> [...]

Applied, thanks!

[1/4] clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled
      commit: 04352db59676ec384fae25ecf1e982a0afa62139

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
