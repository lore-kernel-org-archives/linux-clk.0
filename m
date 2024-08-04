Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF17A2D7B8
	for <linux-clk@vger.kernel.org>; Sun,  4 Aug 2024 12:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722774468; cv=none; b=TF9JjgmaoGTOnPNYXh6sBbRdEAKbk+EysHbLbARC2PCGa2yHI8p0W2VDHY1t0PljjbxeQW2XSdbMzd2H6n8xOHrAa+5ySHQI0bZExt7xLaVQKtjC/Me+c8AJ7cNhLE4+bU+C8DwFyKn8hY9uVtKmgQro4Xa9Zm0EcGAnYA2X2q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722774468; c=relaxed/simple;
	bh=6nEw/qsql7GLNQtUnK0NN5bFtdT4n8J/chPAeQ3SDis=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WDaJ05AhFrwlm3ud4zPdhAiLTgnJLjgFvYkiErGCovYjRwV8e8S3hOjYn4Cg8VQmthu6K56Lz07MM95+ASIlQ6HSEscieOCuB5ddL6kUFgMSbh4T75vl/imX/jN0Nm8ntvsinG1/UHe1EAYV01TOnIE/GM3jZODVLN1R6SdVlwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=UJl/I8Wq; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="UJl/I8Wq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1722774458; x=1723033658;
	bh=HbxeQuACBzRlKisgDmzJ5BbLdirFZhGLjMA7Twqonsk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UJl/I8WqNeQcEXjHYTm8zbJB1Lxqqfymir1PJbQOmn4mcEpVd0D/UTjLpyLtVN+0/
	 P/J1kRxdkekL2+GmvDTSqKJZunpvHUo1XqsAZb/R5huTS8L3AJZd7hPqR2rbB9Egrg
	 1QeRKm6WAmo97DL68h4LxHhTnapQh27FVx7hPrn3uvGmuahu8AQd7O/+f6KGwCYQrS
	 BAWPj8HYUT5Y1zxmqulb3q1LWDwbrgFtUf56Hp3Sf58h1otXjKB52EqIw/R2p5Gil3
	 9Bobn24vJ/VFw7sPAXFO4oSqjS3UCD74X3Y1TsAITbL3nol+hK/aJDGj00J4fcINCR
	 PTkNmtA/IEKag==
Date: Sun, 04 Aug 2024 12:27:32 +0000
To: Harry Austen <hpausten@protonmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/9] clk: clocking-wizard: use newer clk_hw API
Message-ID: <D374KN1NZT6O.3P6C0M5FEHJ6F@protonmail.com>
In-Reply-To: <20240803105702.9621-3-hpausten@protonmail.com>
References: <20240803105702.9621-1-hpausten@protonmail.com> <20240803105702.9621-3-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 9a5e5ed345d8ed34ebabf1020072b0c79d4d664c
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat Aug 3, 2024 at 11:57 AM BST, Harry Austen wrote:
> Utilise clock provider API with struct clk_hw instances instead of the
> consumer-side struct clk.
>
> Signed-off-by: Harry Austen <hpausten@protonmail.com>
> ---
> v1 -> v2:
> - Move onecell data to end of struct for single allocation
> - Just move to clk_hw API. Move devres transition to subsequent patch
>
>  drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 77 +++++++++++-----------
>  1 file changed, 40 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xil=
inx/clk-xlnx-clock-wizard.c
> index 0ca045849ea3e..ccaf30c2d9481 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -17,6 +17,7 @@
>  #include <linux/of.h>
>  #include <linux/math64.h>
>  #include <linux/module.h>
> +#include <linux/overflow.h>
>  #include <linux/err.h>
>  #include <linux/iopoll.h>
> =20
> @@ -121,26 +122,24 @@ enum clk_wzrd_int_clks {
>  /**
>   * struct clk_wzrd - Clock wizard private data structure
>   *
> - * @clk_data:=09=09Clock data
> + * @clk_data:=09=09Output clock data

Realised I probably should have moved this doc comment to the bottom too,
which also resulted in me putting the new `adev` parameter documentation in
a weird location in patch 6. Will fix in v3.

>   * @nb:=09=09=09Notifier block
>   * @base:=09=09Memory base
>   * @clk_in1:=09=09Handle to input clock 'clk_in1'
>   * @axi_clk:=09=09Handle to input clock 's_axi_aclk'
>   * @clks_internal:=09Internal clocks
> - * @clkout:=09=09Output clocks
>   * @speed_grade:=09Speed grade of the device
>   * @suspended:=09=09Flag indicating power state of the device
>   */
>  struct clk_wzrd {

