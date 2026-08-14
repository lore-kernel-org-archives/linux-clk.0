Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AE741B355;
	Fri, 14 Aug 2026 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786702550; cv=none; b=kJKcAFjGtNqkJqW2U+yeM2eA51l3ZVJ8i324cJ2C5UgjGV88p7PJdqInDbzZtc8R4t+39Xa2JlS8awaRGngUyLAZxqKl6OpJy4g5aqpUYeQX+KSx30/nxHSmhvL9aM0HMgY9AwYRGO8VmzqreuphCNAO/JKbiHwXEXtrOXCN67s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786702550; c=relaxed/simple;
	bh=mwHOjyPcBjFJwUy1wg+Xz3IWBa+kx7JlzZt+oq/NInc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anFhCmDUEo5OcQRPj1gLCrFC3RjTw5/ahITmzasmxAS7QZylrxAlY5HbdLkuk0K3QiiktbvYcU/KZVUK/mBdbTtcOUDQfFGz6W9XHfd8BkrBjpNO2zRKhod0SKdrCDrFlHbXfF0mfYlUnZCruyJpyC6nkJWat2TUbtnpVd0tSoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIqmu4aD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIqmu4aD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD691F000E9;
	Fri, 14 Aug 2026 10:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786702535;
	bh=mwHOjyPcBjFJwUy1wg+Xz3IWBa+kx7JlzZt+oq/NInc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FIqmu4aDSrKEH+ei+l9NY/L4Yjn7T8I0CLeqZ81qEbTNQAOm7s62Rz7Wx5vyyGdJi
	 oSpydOQ3VyiDimUK6hJtiSMyexBVgOBzXUwXelgTk/F8d+NhYFVMFa76cVp1H4yfaU
	 4rzqry5CvYED3LjxqCWlpPelIRkty+vAFsniGKbchN4WDk8JZ+r/g7CaF+wcMMCYt2
	 7WVAFv3gWq60azC2yj1Rqk4w6n1xzy/9n3f//b68vGVuDj65IJa38ZFmMwFQ9/2XEI
	 6l6T71Sq1cTycVp9r6RLKYGMRM3dXERDFFl5ACdDMhR+VWdDovbrlCIO2e6yP3k+bw
	 GU27jVw0OGGtA==
Date: Fri, 14 Aug 2026 12:15:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladislav Leonov <vlad@zlab.su>
Cc: linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Simon Glass <sjg@chromium.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/25] dt-bindings: reset: Add RV1106 CRU reset
 definitions
Message-ID: <20260814-pristine-warthog-of-tolerance-4be5cc@quoll>
References: <20260810121121.210040-1-vlad@zlab.su>
 <20260810121121.210040-2-vlad@zlab.su>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810121121.210040-2-vlad@zlab.su>

On Mon, Aug 10, 2026 at 03:10:52PM +0300, Vladislav Leonov wrote:
> Add the reset ID definitions for the Rockchip RV1106 clock and
> reset unit (CRU), to be used by the reset controller driver and
> device tree nodes.

This goes with the binding/compatible using it, where is it?

Best regards,
Krzysztof

