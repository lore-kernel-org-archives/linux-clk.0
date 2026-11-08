Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169356;
	b=L9gikR78ryGxTcCvBodttG8ETcSAgPpaefLYr5tlQoIkTo5rHpg/UDGd3sWnSFuykNuF
	 sd5EqV1eHJG/aq+Ayr3aMIthcpS1kvBeRyA1jTpmzI3UD+TawOpXNaVF2HKbuCG60zhKP
	 gFBBp8BjZOa4hHQz3c+6Tf3K+8OmL6Srgq3acYqBa/9bLjezJd/Jp1B/uR+EDntEKxBH/
	 43ZNkIU6cT8HoMu3rrm0atNPZgOuB+PmrUq979CiYE78rQALjjn5K6qVQDj2u4qMErPui
	 xQJ3EV2++NXSADmGRYxYQtl0h/78K19IlM5DsRgenid8kV0uT5CuftNmOuA1NvqMoaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169356;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rGKA5Y66+GJjnLF7zU3QA2am76rz9BI/FDq7qWoumV0=;
	b=A8cx0FH/mEL+h+x5gjR22FuIU8GavkKeUovybp5pS9jefozzqwWGD9mU+xJeseGm0axG
	 AhmkvuVyoCrxVu2v+R3j1F/qMcLBqzceZ68OCWmiSBDGRs5cI/dPC9oNNnTh/r9aalsKl
	 w+IB6Kh9mCZ8gWPeeI4AlBOWJNaqlTWV88aUnXdm7oUQZ2aqExwpbnFG1bKBfVpyUPuV4
	 XXKHkGZP2/C7OHv3vc7Xae7WnIPXtt+JQRR/EVsJIjMefqMFXe10RZYt/Bxnj/0LNMCzI
	 89rhV9xNb5Na3lO4jpwptBDgvitJwc1TvBQBQVRqVVFti86tjL3TAe2C8aXBHFhhKIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P9QIbdbT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297E260A6F59;
	Sun,  8 Nov 2026 20:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P9QIbdbT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B01501F008A6;
	Sun,  8 Nov 2026 20:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169355;
	bh=rGKA5Y66+GJjnLF7zU3QA2am76rz9BI/FDq7qWoumV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P9QIbdbTw602BMYcdIaMLLyZ8s/oDKsdYCmI4wzZ67H+umnPN2llAu6gGZl3DeoFk
	 8Lhb7aFeZlEul6dW0SEWDf9IvPtb89fbrUmngKqcBEogpvmTFfkyaoyEeksV/zUt8Q
	 og/3a3cBRSnBa8n9GqQU2CP6uyCvPiviVqYqLg6OC6qR6yFOv6VHk99Y6nXooZjVxn
	 DETh3JBMtddVf2/h80uJXbPyz81gMlsTRZTEQLcB3naWqrN50EpOdPVWPkQfPJ8pKW
	 c45G6FioQe/oJcVchMJL3I63hUJrovtIYD59NqXCbpAR6yMq4kXA9ntg38DFTeNM1C
	 QTs/F0eTbpmvA==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Martin Botka <martin.botka@somainline.org>,
	Fabricio Akio <fabricioakio@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: sdm660: keep USB across suspend, give mdss_axi_clk its parent
Date: Sun,  8 Nov 2026 14:19:41 -0600
Message-ID: <179416929276.628393.12600173119556698550.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928-sdm660-clk-fixes-v1-0-5d5bb84e3258@gmail.com>
References: <20260928-sdm660-clk-fixes-v1-0-5d5bb84e3258@gmail.com>
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
Content-Transfer-Encoding: 8bit


On Mon, 28 Sep 2026 14:41:42 -0300, Fabricio Akio wrote:
> Two independent fixes to the SDM660 clock controllers, found while
> bringing up the Motorola Moto X4 (payton, SDM630).
> 
> The first keeps the USB GDSC in retention across system suspend, as
> msm8996, msm8998 and sm6375 already do. Switching it off loses the
> DWC3 glue's QSCRATCH configuration, and USB does not come back after
> resume.
> 
> [...]

Applied, thanks!

[1/2] clk: qcom: gcc-sdm660: Keep the USB GDSC in retention
      commit: cc8215f6c491d846acab9706d92b38fae1ce1b2d
[2/2] clk: qcom: mmcc-sdm660: set num_parents on mdss_axi_clk
      commit: 69c8d5eed1c7e691678424a05f4ec003cd7f8a88

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
