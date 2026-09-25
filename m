Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B284E80A6;
	Fri, 25 Sep 2026 16:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354662; cv=none; b=c/BA64h+2RzEKbwQQe6qfMWZ+LREXt1XmjZLDNvQjyjwGVj1Q0BPn0jUJQiiQXhhm2oWTUEdR7G+fJfJ0vu9rmLtd0SEens1Lc+yKMx4NUwzNzHjIp4PnXVNK/Qo7dCcxo1AxvL9rmtbr0mce7FPRBKweZZI4ww4hHk53TWgzPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354662; c=relaxed/simple;
	bh=V5Y8OqUqBoNN/N0C2UVLx47iZJ4x/8LkUO0A2gc0b48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kBc6Eaeka/u2QEHKHCAJ3fbYdk8nv3FlOtarMzJtzIuI5K8NWZurfOXVWasL+oT+qzHVvyrpUI65lV+1fofcgdXC0Pi3ip4UsPPCNzneeDiP9QaGWbXBjeLVKIoYX8H1zjHoSLEX/4nLnCBR53zpSsluxrOOfPwIqoj7GnsIQ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4js9poF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4js9poF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3111F00899;
	Fri, 25 Sep 2026 16:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354648;
	bh=YUsOMvUvwdFnK5eTPfIL5aCcUBNg+XMPwBTQwrIiIUk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J4js9poFZNakhWYcX6loLubXOr3j6yNRyxjJ9yk1qJnMTMFV3MUAf2AJtMs+fuuNl
	 aUm/5iXRm6d4U697acSNYaLj2TzAhRxj1ZrrzS3rfsexHuAbBxoFU/oBwcOhqDqrVx
	 aUGazSWMGK2GnNNFdAPSi2380W3I5wnoKkhWsIW/8CkzbkqQapVmYhpQf5HU4vXHSL
	 xq3zmZcQ1NQ5pqFNCgG3tqP+scNywtuHQMZ70JGaR4Ua+aJ6Y1HFfdCWrmJtTINWMr
	 616ZFwZGE43Un/RWfhq4jFhvx4uh0D/SRaXyX2LnKUOhh8Ot9N521Yr2wtTVS4f8uj
	 bfWbYwRN71+Mg==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc: Fix GPLL enable register offset for Nord SoC
Date: Fri, 25 Sep 2026 11:43:35 -0500
Message-ID: <179035461252.1296652.10699637228921820105.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924-nord_gcc_offset_fix-v1-1-230ffad2dae9@oss.qualcomm.com>
References: <20260924-nord_gcc_offset_fix-v1-1-230ffad2dae9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 24 Sep 2026 15:09:56 +0530, Taniya Das wrote:
> The GPLLs in the North-East, North-West and South-East global clock
> controllers on the Qualcomm Nord SoC were registered with a placeholder
> enable register offset of 0x0. As a result the shared PLL voting register
> was never programmed, leaving the PLLs' enable state uncontrolled.
> 
> Point each GPLL at its actual GPLL_ENABLE register (0x57010 for the
> North-East and South-East controllers, 0x76008 for the North-West
> controller). Each PLL continues to select its own vote bit through
> enable_mask.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc: Fix GPLL enable register offset for Nord SoC
      commit: a032e3f9c241b9c148f6ef235df8adc8db61eb29

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
