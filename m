Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142073BA236;
	Mon, 22 Jun 2026 13:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136760; cv=none; b=rNYdbgG8CgswNTZ4OM5pcQuFbHnpzt4Ozsvpcf2wPZ3sPHZ0GY8eRaFU66i3HbVGo8pSPg+cBKNsyc/d/V2//WCHI06sz4TpXA7CjwsowrZlkV+IBQ8bsZB3uVALQFqw/p6/zOrEY15xgGgTFERTOobRyo8hatMLQU7vyqZE9Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136760; c=relaxed/simple;
	bh=ckf2CLDcD5bKeJNfALH76945wCUEve6WvHu06tACpbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKBrhQWo1HpiXgZ9rXd4cDAef1uZ258Y29rM0Yw9vvuky59WKnrbKnfIenx97JnHhfy0W7rVOwrqYT4TPY5N77SloJZ6lAKtV+N7ahKYOmA9AtzO5P/vscE5ljjU+NIXeDHqnelydfSe9477rrjjI385z1qnptchosXGEsj+9ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hfH7ldEZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hfH7ldEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42821F000E9;
	Mon, 22 Jun 2026 13:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782136758;
	bh=MWzOfyz2T2EU1PoKiDXZCT09S48JZ9ZqR9VTXBONb08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hfH7ldEZxUXB4JBSpJS4PVZ94sWnAZizGMRIZShEn0UwLfQxMGaXStyExU5p/yGvZ
	 9IJgV7YjnxJspHI9lAOMAm0DOMJWozPUhlo14mTU0++sVcIeSXWRKkFGILuV3ifHej
	 y24SGaI8va+OzbuBs6keJOJovL2HdM/QJEY+Fuyk8fMVokaA/vRk0FTYVmWEOOwN0i
	 GVYQX7yHYTM3Qk1Pcb72DRfTfwq1O1xEyFy+cNEH+GxBZfnR/XfkjnpcEV5SBhZ66a
	 NkY31ZVNarCSAxbi7gODggOqQcleK1HspVP90/YVxasU9CNF1RpkfpXkuuGKOPsTFf
	 9x+UWLszT3vpA==
Date: Mon, 22 Jun 2026 15:59:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] dt-bindings: mailbox: qcom: Document Maili CPUCP
 mailbox controller
Message-ID: <20260622-durable-violet-bittern-5ff7eb@quoll>
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
 <20260618-maili_initial_clock-v1-5-d6ede0352113@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618-maili_initial_clock-v1-5-d6ede0352113@oss.qualcomm.com>

On Thu, Jun 18, 2026 at 10:51:20PM +0530, Taniya Das wrote:
> Document the CPU Control Processor (CPUCP) mailbox controller for the
> Qualcomm Maili SoC. It is software compatible with the X1E80100 CPUCP
> mailbox controller and uses it as a fallback compatible string.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

