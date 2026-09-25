Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEA34AE13A;
	Fri, 25 Sep 2026 16:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354635; cv=none; b=muZy7ssvAG7Ij/k3rdY6TWOyFNeTtwrwljYP+uG5oL/8a/+PWwQmRa41NqhFMr5pXsdnrp1aTpQ/rpwEeEthkI3+C1wKhZFDnsZlxJX2NIuh+JlVhwhawOqQatjoKKz4b0+yrdH8/potH4LjbvvakCoVrlyIsaShzyLtkgST9NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354635; c=relaxed/simple;
	bh=CnLnkZwSoK+dXzVG8GujyakgHKZGXnyZoRoE4BUoCcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IlnCB15lg6ZsO0VJ0lak7nGxtQ6C1ylUhONn9V8OFpWjDmJdIymuDSIu6cWwqnSOIcOu7TBn5+TVRuUjHfYKEED2MFM8sYyyZWkq+U2mZTPkkzvZOTkF84gz++MIdfOCmdDTihhGLklKuBCDL8/74jW6+PVexZYTqI70nIRvmmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcATUGcL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcATUGcL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757711F00893;
	Fri, 25 Sep 2026 16:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354621;
	bh=nUK563BQOfFCI6pq/+NfIBp0sMReD/QJm/6gIpdKbnE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hcATUGcLFZLYeRg//atdZi6S0ACx3GRPbijujaRfH5ZT26YeX9euLDQ3gopD9wGfL
	 z8jAGxvEIPW0j75uNo3szxlI2x3SHiDSwTgK0FeVjjqqYJFsct6NK53RDS9ZC5p4uQ
	 iqSb+FjjG/nSaB4WUwR2w2DudTfS/HVJpBmdkwGfmdU1vJIf6m9K9NgQDJr7YLNhKT
	 ocI4+rGtuBToG6pwOWxrcXzhTZfuaBxx8/vFDimQvGBNhN5EksYNd8oAoRFTn/Ctgl
	 MirVcwzlqp9LbxFFA89M5fgoHrslwIfJ7QLPg0DQcJZ/LwQGqAErwtDdh8GAvuJmGG
	 9pwfDHUFMI/Qw==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: mmcc-msm8960: Configure PLL15 only on APQ8064
Date: Fri, 25 Sep 2026 11:43:20 -0500
Message-ID: <179035461247.1296652.9097024004724051207.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916-clk-qcom-mmcc-msm8960-fix-pll15-config-v1-1-11fae0be111d@oss.qualcomm.com>
References: <20260916-clk-qcom-mmcc-msm8960-fix-pll15-config-v1-1-11fae0be111d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Sep 2026 15:04:41 +0300, Abel Vesa wrote:
> PLL15 is specific to APQ8064, but the shared probe function configures
> it unconditionally, including on MSM8960. Its configuration registers
> at offsets 0x33c through 0x348 exceed the MSM8960 regmap maximum of
> 0x334, so regmap rejects these accesses. The PLL configuration helper
> ignores the errors and probe continues.
> 
> Only configure PLL15 when the selected descriptor is for APQ8064,
> matching the existing variant check for the GFX3D clock adjustments.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: mmcc-msm8960: Configure PLL15 only on APQ8064
      commit: 7cea6757481d3afbc5130963469fdf9cb9875c7f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
