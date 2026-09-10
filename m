Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2084F3B42FB;
	Thu, 10 Sep 2026 08:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030378; cv=none; b=aKT76QD9e1gHTYymTtbZ5Awj14rZrbOOb52RdGnRa8yzwAnfIRwUO7nrJSBu2CDoI40cg7Unr8ZRm7OgCtG9qJYwRaCytYKM7S9OR2d+n5YUY9s18aKH9DrG8QZQgaTaQ1XDBGwegdY0ZMO6apjO9QJsmDi2oaxIC/XdoEcU2cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030378; c=relaxed/simple;
	bh=C04kN9NVVMYxfe4QvVszB/WPCyuazVWbGrPVZzx8orM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYgLNB0J3eJ42CR0wOnTAwuSNBZltzAeZsuW4HhgHcShNdg2E1LeNWsg4tdV4NAFALZnLdPom8HbEMzHHiB4OUMW8LeCjel+q3JD9kbDUI9kpt+DDXwaV7ledbhGjSgMfzy4RDmMG6qoIUJxLm42kiBaVXAnmvBUGHXHHTBtnV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PqgNvKta; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PqgNvKta"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4081F000FF;
	Thu, 10 Sep 2026 08:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789030369;
	bh=tLiTrkBEtyzQyZ+38aToH0yy/G9IJIyyAE5EniGunF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PqgNvKtaZx1jLV0SiljzoiZoUlzyRmiENK+lVU7ul3+izJaEGjhIx5jqtdaFCfiWp
	 Fo0LhGZKY5YFfQ5aqwyV5MWtHsuywAnOxHaoRdaYrmBOpkd3Aq4auX90K+1NMi6tcf
	 d72lq157Razf0KfaLWqiUOT4NndYfwP1dW1QvollBP+wkpna6miya3lEfvWkanyNHg
	 LCTw/rmscstPJg0KN+4PAu1xHxh1co42SWkD0yBm2gG6lq9ppY0ofJu3mR/VMXiytt
	 jA4WlEJV2kBR1v6hns+U0s2kDzCO9J8h+62tuU8gUjLFFD54ftheBI3ZGnXZmI651q
	 SV2ZKKoK+UhPA==
From: matthias.bgg@kernel.org
To: kmehltretter@gmail.com
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthis.bgg@gmail.com>
Subject: Re: clk: mediatek: reset: Fix device registration kernel-doc
Date: Thu, 10 Sep 2026 10:52:27 +0200
Message-ID: <20260910085227.45992-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910033000.15926-1-kmehltretter@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> The comment for mtk_register_reset_controller_with_dev() names the
> older helper and documents np rather than dev. The new helper takes
> a struct device and obtains its device node internally.
> 
> Use the actual function and parameter names and clarify that failures
> return negative error codes.
> 
> Fixes: 761bc64003e3 ("clk: mediatek: reset: Add new register reset function with device")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Matthias Brugger <matthis.bgg@gmail.com>

> ---
>  drivers/clk/mediatek/reset.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
> diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
> index 562ffd290a22..b09cdcab0c4b 100644
> --- a/drivers/clk/mediatek/reset.h
> +++ b/drivers/clk/mediatek/reset.h
> @@ -60,11 +60,11 @@ struct mtk_clk_rst_data {
>  };
>  
>  /**
> - * mtk_register_reset_controller - Register mediatek clock reset controller with device
> - * @np: Pointer to device.
> + * mtk_register_reset_controller_with_dev - Register a MediaTek reset controller
> + * @dev: Device used to manage the reset controller resources.
>   * @desc: Constant pointer to description of clock reset.
>   *
> - * Return: 0 on success and errorno otherwise.
> + * Return: 0 on success, negative errno otherwise.
>   */
>  int mtk_register_reset_controller_with_dev(struct device *dev,
>  					   const struct mtk_clk_rst_desc *desc);
> 
