Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AD83A9610;
	Mon, 20 Jul 2026 17:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784568077; cv=none; b=RWlhVntNj+pGF4OcsMGH5C+i1wgr22UrqFSjUxrsRwbZuBswl2+cIHA9JqIAtF33OfBJfhWs+qkHsMzQqmzYvsnx99noTTp/fQoaInmz/aqiJGH4i4XMU5LSsqEAF36TnScdK/0Y+lvjMEpbt+58vYCpp/fEl53HU1kgWbc1mrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784568077; c=relaxed/simple;
	bh=qkZr0gea4lJlIoS1wU026eamjS4lFQ7sUTAYIxBQ17Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H5t3Lkq0qzOYJknj4yTPva/xi5tLw+9oiTKjR3tx+9OIwiWS9KVvDUZwIPNRdOvIGehHgvHt86R3+E3GvmCYOjW7Y0d1w8sNPx5DXBwyIDBvBSV99akiTEaKB/AIOiAXo72bCZNLauMrN2P2j2NZGyAIi9rSbkYcgb5IX9srlsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKxvRJiu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKxvRJiu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137321F00A3D;
	Mon, 20 Jul 2026 17:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784568073;
	bh=0KjrR4LWw7/aWbnOyfkegysVO8SQ7qRYjW1P4chfasI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TKxvRJiuSS7InGdjjFtvZF0OcKb1W+qTtfnljDgNkQZnHZC4/ZrQML3fGuxy0Hf97
	 T8p0Koz4mHkA8g/2Bh6bAGf7hg/JfWlQhVYbClr14pPRfQRzBHzujM8gJlQXytYUfA
	 LHa//qwoXTP0U7ftwKv39PYvaRgFcOH6iqhmCXJPPZOJ6XlM0Sq4eoxvZLjRSZA0Gg
	 +get9EF3A6nhwXfU9Gn4YwTyKpfl1y5o5sOdQEFHlKf/n3bgRL7VeqNbJ54Vy/tXwd
	 DpFCvSn/00z5K/CuWWBv7sw7O/1y8dNI/AazpP7O1BZ+JMJ0NYmChD1edGGqAIcX7G
	 ycRJ9cHy4DYSw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: camcc-glymur: Add const qualifier for driver_data & CBCRs list
Date: Mon, 20 Jul 2026 12:21:02 -0500
Message-ID: <178456806278.1732507.4874902759825450223.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714-glymur_camcc_const_fixes-v1-1-c635123ebbeb@oss.qualcomm.com>
References: <20260714-glymur_camcc_const_fixes-v1-1-c635123ebbeb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 Jul 2026 10:59:35 +0530, Jagadeesh Kona wrote:
> The qcom_cc_driver_data and critical CBCRs list are never modified by
> common code and are expected to be const. Hence add const qualifier for
> these fields.
> 
> 

Applied, thanks!

[1/1] clk: qcom: camcc-glymur: Add const qualifier for driver_data & CBCRs list
      commit: a9954d40de71cee344dbf9d61600b79379f74bb9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
