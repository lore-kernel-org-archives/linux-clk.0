Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2FE3630B7;
	Mon,  3 Aug 2026 03:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727473; cv=none; b=S14pq1UF6KSs0hZKlJ8kkNuQUFMxaiJxUsy04ZSdcWAO4WSfKNPWlc0U8tWDlMiv/Y74K16pjAWno5GaLuV8tydrM1pyhTXZxpOewzD8vfoEppIlOtpzaArcp6xGMWRG9EUr7A90jMBE+F/r9KdcUCEcc7IkUlCrYJJ3FB1VqQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727473; c=relaxed/simple;
	bh=BP48Bh7JwO4oLIXp/GmPy8CzI/hMf5w4PcI4I8vaT4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OXsDhHZw5IBfZvRCiQgysJwPrQCYx+IXuXRyFtibgP0+QxYsL4wWK6eu9MHz3mr3ouhDXU08o6PeuGhtnfQBjaSaqDF6T5o7Ye9zPrUyNwPNmLO0S17AsyrdQz38t1nETV9gxuGkUJtwsmK6WDiCHj7WzlWGVqzrIdohBJwQZ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aGbHI5Lx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aGbHI5Lx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517611F000E9;
	Mon,  3 Aug 2026 03:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785727471;
	bh=q2cXLWGRZ8YKwZal/yfNRGM2kwI1jn8zH8tiLHDwLdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aGbHI5LxVZU0Ps/JWZ4ExrO6opyWxhEPTejViMhLR810jrUlswDwFveewJ1FnIleD
	 DHmo8SZe96piPbUtPagQQBpi+8BGESXtCpN6VHLocqx57NnFpJ8Pk8cHoBnHsNRHMD
	 PtZMCj7cqbe4MkPbmV+mehdLrjAPcLrQHUumWU0ZKLaMgIB2h+jjsSlvvQI5+RPK87
	 MT01FFmw+8QSRqNdn9JVb98fWiiaw75EoKn3C6qJXz5U8g7vEbTsBwytVnzJBXuWcW
	 ljVNUNanyxqjNpyjfqEwX0GS0IRfIzFg4+A+LNtBFDMba1uMqKSnREcKKecAGFs66Z
	 fQGWgL8V/SNkw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/6] clk: qcom: Add Nord multimedia clock controller support
Date: Sun,  2 Aug 2026 22:24:04 -0500
Message-ID: <178572744548.408250.17845223763051212784.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 24 Jul 2026 16:25:04 +0530, Taniya Das wrote:
> This series adds clock controller support for the multimedia subsystems
> on the Qualcomm Nord SoC platform, along with two fixes for always-on
> clocks that were incorrectly exposed as controllable branches.
> 
> The Nord platform is a multi-cluster SoC that includes dedicated clock
> controllers for the display and graphics subsystems. This series adds:
> 
> [...]

Applied, thanks!

[1/6] clk: qcom: gcc-nord: mark PCIe link clocks as critical
      commit: 6c3a4d971503b04b00d75a37882becb3c2f57f30
[2/6] clk: qcom: negcc-nord: keep GPU2 CFG clock enabled via critical CBCR
      commit: 936e98ef12f714c19150a5595bbd296d9489b2e1
[3/6] dt-bindings: clock: qcom: Document Nord display clock controller
      commit: d6c34c2929f56c9f349062c751ee5c483df3af25
[4/6] clk: qcom: Add Nord display clock controller support
      commit: 9dcc782e208251471cade8ac36c7717a7345ecb4
[5/6] dt-bindings: clock: qcom: Document Nord GPU clock controllers
      commit: 0c51d1ad27cbb236d909165ef8874a10f3537468
[6/6] clk: qcom: gpucc: Add Nord graphics clock controller support
      commit: 47f2e6e1cee19f29d2581a216a9e4c80fd6a34dd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
