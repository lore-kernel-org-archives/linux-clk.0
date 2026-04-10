Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F56729BDBB;
	Fri, 10 Apr 2026 07:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775807225; cv=none; b=niB68VhTKRG/nvZYpxJpTeRcBo1xzC9MUIqm9Un2OYn9nmFcMr1QA9O+W2hloYj2SccKaSVn9vwxuFhY+M4kYyu3yHjGrZHUPomgBSYlogeuP5t8+sVvYyBMth790FAWdcrBsGtIkAa27JJfQY1VfSQYKQcO5ufbje/S6NoAxoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775807225; c=relaxed/simple;
	bh=2u8807k80N/o8AudH72Q0tlw56Nmjjod+/Et+0EN0Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fq51PVb8GQHA6zSqHP6SMxMxeFRpeWywGw/0iFGFhPMeaIVUllB68c4Cqn7NyiVBMyAzdDVSnDdyTAoX1518vsYsHpsBt55TN6ZkA3v/lDjpSuAHEz/XS514+JaLI6pfMJ4I1pJHgoppj95bBqKhMt40d81si02ROhhSXNYwOeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/Lj+Mar; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/Lj+Mar"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D84C19421;
	Fri, 10 Apr 2026 07:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775807225;
	bh=2u8807k80N/o8AudH72Q0tlw56Nmjjod+/Et+0EN0Jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d/Lj+MarNqx6wijAaL5jxtCcWbdC0kz7Q28QWsdJ4WXMz4xxJkyRQ9WNdR6qJ1e0F
	 8KQ4RAo58xextt+8r3VF97htN8KRKAbQ2kjTF6ZK97Oh6QDzfYNSf/BkFLOEOoa6NO
	 Q10nhfmEbTGUawwua1uIZOAVehA4lcGuqqu5SwebL9OtKA4w/D1KiwTRN19nf58TQS
	 XFb35lJrQtrnEH3rCBHE2jqsQC+cStp5vn4od/hqtkhS5kVOM1DPXbJISZMzYGYjP9
	 Q7YMtm2YE5NSaPy5wZ/pHYBRldj0lqFylvtujP9DG5mDJDgDJxLq/lPqWIowSkg9mY
	 QxhqyO/XdS3GA==
Date: Fri, 10 Apr 2026 09:47:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/8] dt-bindings: clock: qcom: Add support for CAMCC
 for Eliza
Message-ID: <20260410-hasty-pony-of-tempering-4f0a47@quoll>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-3-bc0c6dd77bc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-3-bc0c6dd77bc5@oss.qualcomm.com>

On Thu, Apr 09, 2026 at 11:40:44PM +0530, Taniya Das wrote:
> Update the compatible and the bindings for CAMCC support on Eliza SoC.

I do not see any update here. Also, no improvements after v1 comments.

Best regards,
Krzysztof

