Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D933368BF;
	Sat, 11 Jul 2026 19:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799409; cv=none; b=pi4tI4JbNjlBBxzGVkH+z38kGs+/ijqTZW8MMESMeTpp5G7Nq2/XFvDYp0S2tcfxvU9gLm/SuHNov/muULe6ePnxD2VGKgw8GZpHq4AW+gDWFe/P2ETMWRU+pHxmLTiGSnap4PVLTrUB0hvqJ44X5nxGyP5cFIYNP/QOtsWiT58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799409; c=relaxed/simple;
	bh=sWRoGkivI19/9mqiyi+4GfECQ/0PVuZ3sjUrb7ueaqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qh9JHMQsyctgu8zp/F4oHrdEhLLZLlNIAUiWzOqD3Jd6imYcS2T+Qu+/KuuZEZUi1aiG6zR9K16jfHYJmSn4qqmzmmz/P/hknPt0BNTsn6yYawOqFwUIM/62gY7W7UKrT/UlIxs7tMrgKHE3LlvDACYbrRunyh28AjFej7dfeJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TMX327/V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TMX327/V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB551F00ADB;
	Sat, 11 Jul 2026 19:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799407;
	bh=wv6D8cyEArFQVvp5s9Mwg8netaicxSm14KRNIPLAUHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TMX327/VKJDmVS5hHLs/pf65rTU8NB8pnZacUj9ZaHSqhrqAacrdb5OwZvqD+np6/
	 gHYLLF1LkDYwCL4hn2gdSS6S+RnMwL2cQ1iCuELS6AUyv+qw3d/935qT2Ff9ItMM77
	 DpFSHRiTXv0Tu6m5V6bSMy82pY/iY0mmImPma4hTHEB8kIikeof510+7j193JsqhDu
	 dJ3Re/Iw6iBxuZfBSOZANg4M3XuQ+U786uQYL5H5KCeJA1lP07K0Js2H+Rrm96cIW7
	 +0rhVxd/v0/a1rQHChgFA+Dy5B5krYCuPptSroN/mC5f5MCUWcJPTzey1mi7jBsJqc
	 uY3/TkhmFCN+Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] dt-bindings: clock: qcom: camcc and videocc improvements
Date: Sat, 11 Jul 2026 14:49:46 -0500
Message-ID: <178379938603.163099.11379673434084863598.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
References: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 08 Jul 2026 11:48:38 +0200, Krzysztof Kozlowski wrote:
> Hardware needs certain levels on rails, thus document it.
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[1/3] dt-bindings: clock: qcom,sm8450-camcc: Drop qcom,sc8280xp-camcc from "if" block
      commit: f54ac9a7096bc091813e3ef92021e1acf1e725a9
[2/3] dt-bindings: clock: qcom,sm8450-camcc: Require required-opps on SM8750
      commit: 9b9139d88c1a14535e8fd85e11e15ee3ccda48c9
[3/3] dt-bindings: clock: qcom,sm8450-video: Require required-opps on X1E80100
      commit: ecb42d97c8e143e8d9482e8d7019d06019cd961b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
