Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C015B331EC0;
	Wed,  2 Sep 2026 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352060; cv=none; b=ff0E78jbLAWeveyXa6YMmzn+vRxD9QpAMWxRkSEoPviNXWI/weVNbCsuQMR++Iwukj6p4na7GEuzqSTzFv+PazifzucNbJlgffvrBQaxI2Mu7ZVmWL2lAgZmH6Yx7wK9iKacGtd6Ne1tsFvmyo/Uf7eOzBT48Qcjg2HmlEkI1es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352060; c=relaxed/simple;
	bh=4cq2HBhW+HrAcYFOG0hzBoWqbEEXw2VR6ZaRxyssg3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hs1rq+Md0AzItY8lPp7u3Tus+mZE/UKvKnX6JNXPojKC1cuPqGwJzoXDia6idXvWzsf53LOHW6wO1u3QP1Mk36w0Xox/E1Y1RNvtYQ3oNEhbJ50RGxmPdXQKDwUN4WCKFqN7IbJwJcU/C3Np4z6XA0Rlzo2ZhIIgZsAasLx7HjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Txj2ypat; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Txj2ypat"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F171F000E9;
	Wed,  2 Sep 2026 12:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788352059;
	bh=cnKcgrQs5tMh3nA6DdHEwIWbMetx4pzMXVC7Ml8du0I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Txj2ypat54asZadW/Fn54L9/6HualZ8FALZ3ejT0POf2I9vfgy0s3FkIDhTNEeqdg
	 o+gS6dx4FmmPZwdyqBABESwihvT2RKveMN10QLMFgeGIWafsjzjFcGii/mrZ3rfA6c
	 iQQB9mxzcsaCJbuoESGHw04uK0bdfhAHQt0b71yMn/0rje+xcxV7td9erbOU6FX80L
	 aiH+T9PumvqLCZDuEV37jPK5ZpTWKutORmshy/Toe13xHEBYKtBOxGqkrYgpSJrdQR
	 s5/0TcXibaHpnDtfK53SRC3/NuknE3pQS9e65jPb+guW9sIrexCFLFR4H0GFMjDhFv
	 n2GeC1mbdjvag==
Message-ID: <3f6b4a6e-d4b2-4b2c-b4da-2a750f9afc96@kernel.org>
Date: Wed, 2 Sep 2026 14:27:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add Abel as reviewer for Qualcomm clocks
 drivers
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260902-maintainers-clk-qcom-add-reviewer-v1-1-dd6b6799b494@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20260902-maintainers-clk-qcom-add-reviewer-v1-1-dd6b6799b494@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/2/26 1:58 PM, Abel Vesa wrote:
> As agreed with Bjorn off-list, I'm stepping up as reviewer
> for Qualcomm clocks drivers.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad
