Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A1D43B3D9;
	Mon, 10 Aug 2026 18:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387576; cv=none; b=ga1MJKaogLUSyckJ48bWqJwoxmO2tgRc2e0OcFp7LHHKPLubzrkZJ6HcAeBYzLskza4jmDw8/zHrCT3p6wBwpGORItwxBtKd/haG+9lg/ZQSitfxq050m2n4fY6PPzQ4xybxg/LaV7kRx94wDHolqoOduKhePmMCqRlPJdPs/08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387576; c=relaxed/simple;
	bh=em4zrAjzL/3Szk8+CpTUqlfOjBU4ITvUWnk2H7yG7mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S5AZMCBFsYMfTIgcWQLwME50iO6oeziV9bavRjZtkAW0T3mFXBtTxrCe9B4VAI1pW/4JgzO2x+ALTW+UnUvzq61gFD39V2WRKrUPNHJ5cXfRugJinljSee6K9HShm0R5Gz8wO+UfczAybuO7y8MbDZOcuUiG8oS6P/G07vIYbYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DuxWdFFF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DuxWdFFF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15A11F000E9;
	Mon, 10 Aug 2026 18:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387575;
	bh=e0FMRuGD0Z+hRnnxS/RWbJELk+hheTIVBff5zzNJ4IM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DuxWdFFFr17RAe8PcB6pn+9jDeMVjDd1itLqG37utmRlHfz3BoC1E4FZ0VWaU41Ps
	 c8hIugYVEHGRZsre2qu6PLTGtJ5lI5ykk8uVEvUPDRZI2dyiiCZb+qxBUQUB4z6Zc6
	 D9K7qm5QDvM+xHp8m37qPNfKClHu3n6aGbvo7mCSFqCqusGm344dmPh2rCHHxE9NsQ
	 62aSX/cOknXSMbryPUOC0Jz+k2B80mrNyh/wKnbOZlyh666sjMfxkfjF7gJ6CUowYT
	 lcUUmivKmob633OlV9h9ONLvsT+4gHxXQnjxUe7OnT5fX/MpHdqF3JkFth8KteBbua
	 kufAbme4nvkPQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] clk: qcom: Mark the GPU CX GDSC as votable for Glymur and Kaanapali
Date: Mon, 10 Aug 2026 13:46:00 -0500
Message-ID: <178638756039.656675.18216993973575391901.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801-kaanapali-gpu-voteable-v1-0-fe804d24d2e9@oss.qualcomm.com>
References: <20260801-kaanapali-gpu-voteable-v1-0-fe804d24d2e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 01 Aug 2026 23:01:16 +0530, Taniya Das wrote:
> The GPU CX GDSC on both Glymur and Kaanapali is a votable power
> domain, but it was configured with POLL_CFG_GDSCR instead of VOTABLE
> when the respective GPUCC drivers were added. Fix both drivers to set
> the VOTABLE flag so the GDSC driver correctly treats collapse requests
> as always successful, matching other platforms with a votable GPU CX
> GDSC (e.g. SM8750, Milos).
> 
> [...]

Applied, thanks!

[1/2] clk: qcom: gpucc-glymur: Mark the GPU CX GDSC as votable
      commit: 370520c31b0f78d56d39d754b7e137c20b2fd625
[2/2] clk: qcom: gpucc-kaanapali: Mark the GPU CX GDSC as votable
      commit: 882c1a7721ea299008489953994b468c3171c249

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
