Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E151438AC8D;
	Mon, 31 Aug 2026 20:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207702; cv=none; b=rVHwO6azlCy2M9mgaqSk88n5VCpfM9X+vcA4/zfZ0YQoRNIbh3C6lRc0i677k46iKn/C286c0BKlnYGOaXgWHg8pmdtxTT5VPGGkq+9U3g2doXC2WSKCvCc1PUrV31IbQkkt5rTrS11LdiQ2sNUvg3Jv66SwF18bQ/svaUmjQhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207702; c=relaxed/simple;
	bh=+SIHKattbaBzmkjM7vuLFCcDiwu3VzkgW5SMQhGNs0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O71s9YWDEeogx92XX27lTbJZNLHvZT/+GcXfAn8ljAx++GzoNLHps9WCviOjvpIyCga/Sj0hXiH0XNlh2UsUTAjFOPnzXGJeKGAPAiL716tu+WutjCHpqy266S44WOzL/4Pck46wWfbNmA0+INyevH2I13lSD26d3j5kVWJWiW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkUEVi6m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkUEVi6m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B691F00A3D;
	Mon, 31 Aug 2026 20:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788207700;
	bh=WQME0PTl19syN+oMA8B3zFqQ4lamzKCEe2v/b6baZKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SkUEVi6mfj99ZjoI6TweQhMYs3SpxVgqgj7Jxy+10bZxTO6ZZv4AOoXNFlQKOCsMt
	 tZ4lGDvCGNbEkZ/Gl0pl3/A3P0tVjlAI9qcc1W0SGFwDpD3rcOILmzNixjXaVFN9GW
	 +xU+YVBlItlUfI7cXFnvpxLzCd3DlpgUy8VawC7svFcGJlQGbWRLs4Vu3HMZdQ4Dyt
	 KfPego9O4epvZLp8cRVEHYVa6xSfOoqKt7uKyBZz2KP19h+LpwhidVkN40ojVTUEbC
	 uR9uOPwaXHI45xeYdyD1mIzucmqjlqYbmw5qScBvoRBBDz2+YgKs/h3OQoSlo9B3cj
	 pee8egaLyjKUQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] clk: qcom: Add Graphics clock controllers support for Qualcomm Maili SoC
Date: Mon, 31 Aug 2026 15:21:18 -0500
Message-ID: <178820768661.1699313.5103382541381473016.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801-maili_gpucc-v1-0-9d8c37bded69@oss.qualcomm.com>
References: <20260801-maili_gpucc-v1-0-9d8c37bded69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 01 Aug 2026 00:42:44 +0530, Jagadeesh Kona wrote:
> This series adds support for the Graphics clock controllers on the
> upcoming Qualcomm Maili SoC.
> 
> This series is dependent on Hawi GPUCC series:
> https://lore.kernel.org/all/20260730-gpucc-hawi-v2-0-7bf618ab8a34@oss.qualcomm.com/
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: qcom: Add Maili Graphics Clock Controllers
      commit: 74b41b78aabfaf021ca4ca2aebae75fdb538b9a9
[2/2] clk: qcom: Add Graphics clock controller support on Qualcomm Maili SoC
      commit: bc1cff907773a5d00475efa860d18def4f5f3b79

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
