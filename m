Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CEB481FBC;
	Wed, 12 Aug 2026 15:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786549076; cv=none; b=sgTKvrBNQAsBz1g4N+Uh9mug3h8dCczgeDWcOogAM1yhK2QBMkbbfoU4Ylp0+pGGTKW9jKMIXSnAJ8+9ovIml84PnmMiZFw91Qp4pGpPY2+MaTeBUsPwWeGv0mnERqs4BkN1kpkGVEC+SYJLS4PGQ2tkheht8ujolhUE43Kasa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786549076; c=relaxed/simple;
	bh=VHIHrWMaSg6qLmWoLLlFNSQGgCX4Pn5PGZplQepah1Q=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=unYcx+pgm1jfJiwTZkQeOb2uobkIwVY80euEyVxYdZRIqcrj4BMjnTyY1hWK9+XaxSZg6UMQ3i3IDNK597vPEhNQ/krfWXRKteDm/dvgEVoODGjzsH5O6NjwtMLZTmWjxXXHSH74Dbzz14dhwNhAqXOmsP1PsfqZtjJpj25rNF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LlCiLZHw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LlCiLZHw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964C51F01564;
	Wed, 12 Aug 2026 15:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786549060;
	bh=MnsGKFuMBTOgjRQ7tE0YFIFN0I5+jqQT6Tbo+szNMH8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=LlCiLZHw3+ofYE4Ie3tuXkPweSejU6Ki5L0+yYDa/Qv43PLea15SMHIwyy387VJb7
	 EhxWSJevaftiZ0e/IhAjshZrl9hv9k9kwgyr9ZHwt6Ca0RI+bOuMrFYfeJsnQ2cS0i
	 pIgcDU9sSkDgJKRxKWN0Sen0G/v4xpfvk4EXRZDbswCmA35xuJhQSt0RFqpwPWKEPQ
	 QyKz2uCg+fdofZVWEwv0v/QORFdbZoPTQKl5HbFsZE+VfHeWRzgTlm+MndQgmV2aJR
	 1A5bXbbABFEL/DV8IkUUI7wl7nZ0J36ioHqsPN2vV0Y3NHuAuN1sPIoMsQZtGhylFW
	 cZt9nX9PIIFFw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260807155830.603972-1-andersson@kernel.org>
References: <20260807155830.603972-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v7.3
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Imran Shaik <imran.shaik@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, Stephan Gerhold <stephan.gerhold@linaro.org>, Stephan Gerhold <stephan@gerhold.net>, Qiang Yu <qiang.yu@oss.qualcomm.com>, Herman van Hazendonk <github.com@herrie.org>, Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Lin Li <zhuolin.li@oss.qualcomm.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>, Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet@baylibre.com>, Luca Weiss <luca.weiss@fairphone.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Vladimir Zapolskiy <vz@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Wed, 12 Aug 2026 08:37:38 -0700
Message-ID: <178654905858.5862.417176047042178047@lazor>
User-Agent: alot/0.12

Quoting Bjorn Andersson (2026-08-07 08:58:30)
>=20
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-7.3
>=20
> for you to fetch changes up to c7d44572a85ae1b897e0bf95357439ee75ddbcc7:
>=20
>   clk: qcom: Add support for Qualcomm GPU Clock Controller on Shikra (202=
6-08-04 10:39:11 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next.

BTW, the free form paragraphs are nice and all but I usually end up
rewriting it into bullet points. Maybe next time you can give a quick
summary up front and point out anything that is out of the ordinary or
needs a closer look.
